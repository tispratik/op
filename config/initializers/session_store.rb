# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OP_session',
  :secret      => '07cce76bbac33705c9d8aa9d4036bbff473812844d6575eee29a996da2e4d8bd91dbe9e56d6e31e86862c5a38d030e7e1dfd46dee9df6dcf9b886c58da5d8ef4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
