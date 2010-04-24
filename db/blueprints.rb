require 'machinist/active_record'
require 'random_data'
require 'faker'
require 'populator'
require 'time_extensions'

countries = Country.all.map(&:ison)
a_phone_type = Decode.all_values_by_decode_name("OP_Phone_Type")
a_personal_web_page_type = Decode.all_values_by_decode_name("OP_Website_Type")

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
  telnum2       { Random.international_phone }
  telnum1_type  { a_phone_type.rand }
  telnum2_type  { a_phone_type.rand }
  is_telnum1_public { Random.boolean }
  is_telnum2_public { Random.boolean }
  webpage1       { 'http://' + Faker::Internet.domain_name }
  webpage2       { 'http://' + Faker::Internet.domain_name }
  webpage3       { 'http://' + Faker::Internet.domain_name }
  webpage1_type  { a_personal_web_page_type.rand }
  webpage2_type  { a_personal_web_page_type.rand }
  webpage3_type  { a_personal_web_page_type.rand }
  short_description      { Populator.words(10..50) }
  time_zone      { Time.random.zone }
  is_address_public   { Random.boolean }
end

Workposition.blueprint do
  title           { Faker::Lorem.sentence }
  start_date      { Random.date }
  end_date        { Random.date }
  description     { Populator.words(10..50) }
end

Education.blueprint do
  degree          { ["BCOM", "BSC", "ENGINEERING", "MS", "PHD"].rand }
  field           { ["Computer Science", "IT", "Architecture", "Chemical", "Medical"].rand }
  education_type  { ["Full Time", "Part Time"].rand }
  start_date      { Random.date }
  end_date        { Random.date }
  description     { Populator.words(10..30) }
end

Interest.blueprint do
  name            { ["Sports", "Biking", "Rafting", "Singing", "Music", "Coding", "Travelling", "Space Exploration"].rand }
  description     { Populator.words(10..30) }
end

Uprofile.blueprint do
  summary      { Populator.words(10..30) } 
  specialities { Populator.words(10..30) } 
  honorsawards { Populator.words(10..30) } 
  linkedinurl { 'http://www.linkedin.com/in/' + Faker::Name.first_name }
end  

Usocial.blueprint do
  application { ["Facebook", "Twitter", "Orkut", "MySpace"].rand}
  application_login { Faker::Name.first_name }
  atoken { Random.alphanumeric }
  asecret { Random.alphanumeric }
end