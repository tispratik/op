require "#{RAILS_ROOT}/db/blueprints"

[Usr, Ucontact].each(&:delete_all)

p "creating usr"

User.all.each do |u|
  Usr.make(:user => u)
  Ucontact.make(:user => u)
end