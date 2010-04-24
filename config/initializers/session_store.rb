# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_OP_session',
  :secret      => '5b5a272b133155ed85af4ecef0a3e8c3172dc4078f6b1f8b72a6ab5c5d0fde34a90d61f3375b66d847538e7a408e42d180c161d439889078b05659c6afa3628e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
