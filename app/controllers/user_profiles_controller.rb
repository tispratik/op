class UserProfilesController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /user_profiles
  # GET /user_profiles.js
  # GET /user_profiles.xml
  # GET /user_profiles.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @user_profiles }
      format.json  { render :json => @user_profiles }
    end
  end
  
  # GET /user_profiles/:id
  # GET /user_profiles/:id.js
  # GET /user_profiles/:id.xml
  # GET /user_profiles/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @user_profiles }
      format.json  { render :json => @user_profiles }
    end
  end
  
  # GET /user_profiles/new
  # GET /user_profiles/new.js
  # GET /user_profiles/new.xml
  # GET /user_profiles/new.json
  def new
    @user_profile = UserProfile.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @user_profile }
      format.json  { render :json => @user_profile }
    end
  end
  
  # GET /user_profiles/:id/edit
  def edit
  end
  
  # POST /user_profiles
  # POST /user_profiles.js
  # POST /user_profiles.xml
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(params[:user_profile])
    
    respond_to do |format|
      if @user_profile.save
        flash[:notice] = "User profile was successfully created."
        format.html { redirect_to(@user_profile) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @user_profile, :status => :created, :location => @user_profile }
        format.json  { render :json => @user_profile, :status => :created, :location => @user_profile }
      else
        flash[:error] = "User profile could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @user_profile.errors, :status => :unprocessable_entity }
        format.json  { render :json => @user_profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /user_profiles/:id
  # PUT /user_profiles/:id.js
  # PUT /user_profiles/:id.xml
  # PUT /user_profiles/:id.json
  def update
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        flash[:notice] = "User profile was successfully updated."
        format.html { redirect_to(@user_profile) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "User profile could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @user_profile.errors, :status => :unprocessable_entity }
        format.json  { render :json => @user_profile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /user_profiles/:id
  # DELETE /user_profiles/:id.js
  # DELETE /user_profiles/:id.xml
  # DELETE /user_profiles/:id.json
  def destroy
    respond_to do |format|
      if @user_profile.destroy
        flash[:notice] = "User profile was successfully destroyed."
        format.html { redirect_to(user_profiles_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "User profile could not be destroyed."
        format.html { redirect_to(user_profile_url(@user_profile)) }
        format.js   # destroy.js.rjs
        format.xml  { head :unprocessable_entity }
        format.json  { head :unprocessable_entity }
      end
    end
  end
  
  protected
    
    def collection
      paginate_options ||= {}
      paginate_options[:page] ||= (params[:page] || 1)
      paginate_options[:per_page] ||= (params[:per_page] || 20)
      @collection = @user_profiles ||= UserProfile.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @user_profile ||= UserProfile.find(params[:id])
    end
    alias :load_resource :resource
    
end