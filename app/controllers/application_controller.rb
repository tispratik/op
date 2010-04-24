class ApplicationController < ActionController::Base
  
  #Sanitizes all the input params for POST and PUT requests
  # sanitize_params
  
  include Authentication
  include GuiHelpers
  include RoutingErrors
  #include ExceptionNotifiable
  
  helper :all
  protect_from_forgery
  before_filter :set_user_time_zone, :remove_param
  
  private
  
  def set_user_time_zone
    Time.zone = current_user.ucontact.time_zone if (current_user && current_user.ucontact)
  end
  
  def remove_param
    params.delete_if {|key, value| value == "ANY" }
  end
  
  def ssl_supported?
    (ENV['RAILS_ENV'] == 'production')
  end
  
  def ssl_required
    if !request.ssl? && ssl_supported?
      redirect_to :protocol => "https"
      flash.keep
      return false
    end
  end
  
  def find_project
    @project = Project.find_by_permalink(UrlStore.decode(params[:project_id]))
    if @project.use_ssl?
      ssl_required
    end
  end
  
  def check_project_membership
    # check for any role within project
    if @project.roles.first(:conditions => {:user_id => current_user.id})
      #allowed to proceed
    else
      record_not_found
    end
  end
  
  def check_project_ownership
    if @project.roles.first(:conditions => {:user_id => current_user.id, :name => "O"})
      #allowed to proceed
    else
      record_not_found
    end
  end
  
end
