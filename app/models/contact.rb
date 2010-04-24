class Contact < ActiveRecord::Base
  
  OP_PHONE_TYPES = Decode.find_all_by_name("OP_Phone_Type")
  belongs_to :country
  
  def set_location_from_ip(ip_addr)
    geoipobj = GeoIP.new("#{RAILS_ROOT}/db/geoip/geolitecity.dat").country(ip_addr)
    if geoipobj != nil
      self.country = Country.find_by_iso3(geoipobj[3])
      self.state = geoipobj[2] + "." + geoipobj[6]
      self.zip = geoipobj[8]
      
      if city = City.find_by_name(geoipobj[7])
        self.city = city.name
        self.time_zone = ActiveSupport::TimeZone::MAPPING.index(city.timezone)
      end
    end
  end
  
end
