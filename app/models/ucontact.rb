class Ucontact < ActiveRecord::Base

  OP_PHONE_TYPES = Decode.find_all_by_name("OP_Phone_Type")
  OP_WEBSITE_TYPE = Decode.find_all_by_name("OP_Website_Type")
  belongs_to :user
  belongs_to :country
  belongs_to :region
  belongs_to :carrier
  
  validates_presence_of :city, :state, :country, :zip, :time_zone
  
  def getcarriers
    Carrier.find_all_by_country_id(country_id)
  end
  
  def is_sms_support_avail?
    a = Carrier.find_all_by_country_id(country_id)
    if a.empty?
      return false
    else
      return true
    end
  end
  
end