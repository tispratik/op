class User < ActiveRecord::Base
  
  establish_connection "va_#{RAILS_ENV}"
  
  has_one :usr
  has_one :ucontact
  acts_as_authentic do |a|
    a.logged_in_timeout = 100.minutes # default is 10.minutes
    a.validates_format_of_login_field_options :with => /^\w+$/, :message => "only numbers, letters and underscore allowed"
  end
  
  def self.find_by_username_or_login_email(login)
    find_by_username(login) || find_by_login_email(login)
  end
  
  def to_param
    username
  end
  
  def to_s
    [usr.first_name, usr.last_name].join(' ')
  end
  
  def self.curr_user
    Thread.current[:curr_user]
  end
  
  def self.curr_user=(user)
    Thread.current[:curr_user] = user
  end
  
  def self.cid
    curr_user.id
  end
  
end