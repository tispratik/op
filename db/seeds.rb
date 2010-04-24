require "#{RAILS_ROOT}/db/blueprints"

[Usr, Ucontact, Education, Interest, Workposition, Uprofile].each(&:delete_all)

p "creating usr"

User.all.each do |u|
  Usr.make(:user => u)
  Ucontact.make(:user => u)
  3.times do
    Uprofile.make(:user => u)
    Interest.make(:user => u)
    Education.make(:user => u)
    Workposition.make(:user => u)
    Usocial.make(:user => u)
  end
end