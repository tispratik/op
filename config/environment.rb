RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.active_record.colorize_logging = false
  config.active_record.timestamped_migrations = false

  config.time_zone = 'UTC'

  config.gem 'mysql'
  config.gem 'haml'
  config.gem 'will_paginate'

  config.gem 'email_veracity'
  config.gem 'searchlogic'
end

ActionView::Base.sanitized_allowed_tags.delete 'div'

require 'paperclip'

# hack for using Time.zone.now instead of Time.now
class Date
  def self.today
    current
  end
end

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default] = "%B %d, %Y %H:%M"
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] = '%Y-%m-%d'

