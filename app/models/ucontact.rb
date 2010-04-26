class Ucontact < ActiveRecord::Base
<<<<<<< HEAD
  OP_PHONE_TYPES = Decode.find_all_by_name("OP_Phone_Type")
  belongs_to :user
  belongs_to :country
=======
  
  OP_PHONE_TYPES = Decode.find_all_by_name("OP_Phone_Type")
  belongs_to :user
  belongs_to :country
  
>>>>>>> 983408037d2d6bc6f03087d705474697119c42d4
end