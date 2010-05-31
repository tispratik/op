ActionController::Routing::Routes.draw do |map|
  
  # registration and login
  map.resource :registration, :only => [:new, :create, :edit, :update, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
  map.with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
  end
  
  map.resources :users do |u|
    u.resources :usrs
    u.resources :usocials
    u.resources :ucontacts
    u.resources :assets
    u.connect '/assets/:id/:style', :controller => 'assets', :action => 'show', :conditions => {:method => :get}
  end
  
  map.connect "live_validations/:action", :controller => "live_validations"
  map.resources :comments, :member => {:quote => :get}
  map.root :controller => :registrations, :action => :edit
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
