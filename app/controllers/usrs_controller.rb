class UsrsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /usrs
  # GET /usrs.js
  # GET /usrs.xml
  # GET /usrs.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @usrs }
      format.json  { render :json => @usrs }
    end
  end
  
  # GET /usrs/:id
  # GET /usrs/:id.js
  # GET /usrs/:id.xml
  # GET /usrs/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @usrs }
      format.json  { render :json => @usrs }
    end
  end
  
  # GET /usrs/new
  # GET /usrs/new.js
  # GET /usrs/new.xml
  # GET /usrs/new.json
  def new
    @usr = Usr.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @usr }
      format.json  { render :json => @usr }
    end
  end
  
  # GET /usrs/:id/edit
  def edit
  end
  
  # POST /usrs
  # POST /usrs.js
  # POST /usrs.xml
  # POST /usrs.json
  def create
    @usr = Usr.new(params[:usr])
    
    respond_to do |format|
      if @usr.save
        flash[:notice] = "Usr was successfully created."
        format.html { redirect_to(@usr) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @usr, :status => :created, :location => @usr }
        format.json  { render :json => @usr, :status => :created, :location => @usr }
      else
        flash[:error] = "Usr could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @usr.errors, :status => :unprocessable_entity }
        format.json  { render :json => @usr.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /usrs/:id
  # PUT /usrs/:id.js
  # PUT /usrs/:id.xml
  # PUT /usrs/:id.json
  def update
    respond_to do |format|
      if @usr.update_attributes(params[:usr])
        flash[:notice] = "Usr was successfully updated."
        format.html { redirect_to(@usr) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Usr could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @usr.errors, :status => :unprocessable_entity }
        format.json  { render :json => @usr.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /usrs/:id
  # DELETE /usrs/:id.js
  # DELETE /usrs/:id.xml
  # DELETE /usrs/:id.json
  def destroy
    respond_to do |format|
      if @usr.destroy
        flash[:notice] = "Usr was successfully destroyed."
        format.html { redirect_to(usrs_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Usr could not be destroyed."
        format.html { redirect_to(usr_url(@usr)) }
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
      @collection = @usrs ||= Usr.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @usr ||= Usr.find(params[:id])
    end
    alias :load_resource :resource
    
end