class Carrier < ActiveRecord::Base
  
  establish_connection :ref_area
  belongs_to :country
  
  def self.bycid(country_id)
    find_by_country_id(country_id)
  end
  
end