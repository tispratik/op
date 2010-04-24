ActionController::Routing::Routes.draw do |map|
  
  
  # registration and login
  map.resource :registration, :only => [:new, :create, :edit, :update, :destroy], :as => :users,
      :path_names => {:new => :sign_up}, :member => {:validate => :post}, :collection => {:regions => :get, :cities => :get}
  
  map.with_options(:controller => 'user_sessions', :name_prefix => nil) do |session|
    session.new_user_session     "sign_in",  :action => :new, :conditions => {:method => :get}
    session.user_session         "sign_in",  :action => :create, :conditions => {:method => :post}
    session.destroy_user_session "sign_out", :action => :destroy, :conditions => {:method => :get}
  end
  
  map.resources :users do |users|
    map.resources :usrs
    map.resources :usocials
    map.resources :interests
    map.resources :educations
    map.resources :workpositions
    map.resources :ucontacts
    map.resources :uprofiles
  end
  
  map.root :controller => :users, :action => :me
  
end
