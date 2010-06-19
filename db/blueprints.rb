require 'machinist/active_record'
require 'random_data'
require 'faker'
require 'populator'
require 'time_extensions'

countries = Country.all.map(&:ison)
a_phone_type = Decode.all_values_by_decode_name("OP_Phone_Type")
a_web_page_type = Decode.all_values_by_decode_name("OP_Website_Type")

Usr.blueprint do
  first_name            { Faker::Name.first_name }
  last_name             { Faker::Name.last_name }
  one_line_bio          { Populator.words(10..50) }
  dob                   { Random.date }
end

Ucontact.blueprint do
  city          { Random.city }
  state         { "US.#{Random.state}" }
  country_id    { countries.rand }
  street1       { Random.address_line_1 }
  street2       { Random.address_line_2 }
  zip           { Random.zipcode }
  state         { "US.#{Random.state}" }
  telnum1       { Random.international_phone }
  telnum1_type  { a_phone_type.rand }
  is_contact_public { Random.boolean }
  webpage1       { 'http://' + Faker::Internet.domain_name }
  webpage2       { 'http://' + Faker::Internet.domain_name }
  webpage3       { 'http://' + Faker::Internet.domain_name }
  webpage1_type  { a_web_page_type.rand }
  webpage2_type  { a_web_page_type.rand }
  webpage3_type  { a_web_page_type.rand }
  short_description      { Populator.words(10..50) }
  time_zone      { ActiveSupport::TimeZone.all.rand.name }
  is_address_public   { Random.boolean }
end