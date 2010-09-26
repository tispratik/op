class UsersController < ApplicationController
  
  before_filter :login_required
  before_filter :find_project, :except => [:me, :show]
  
  def show
    @user = User.find_by_username(params[:id])
  end
  
  def me
    @user = current_user
    render :show
  end
  
  #  def index
  #    @users = eval(get_query)
  #  end
  #    
  #  private
  #  
  #  def get_query
  #    qry = "@project.users"
  #    qry = qry + sort_order('ascend_by_username') 
  #    qry = qry + ".paginate(:page => #{params[:page] || 1}, :per_page => 8)"
  #  end
  
end