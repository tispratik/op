class UsocialsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /usocials
  # GET /usocials.js
  # GET /usocials.xml
  # GET /usocials.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @usocials }
      format.json  { render :json => @usocials }
    end
  end
  
  # GET /usocials/:id
  # GET /usocials/:id.js
  # GET /usocials/:id.xml
  # GET /usocials/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @usocials }
      format.json  { render :json => @usocials }
    end
  end
  
  # GET /usocials/new
  # GET /usocials/new.js
  # GET /usocials/new.xml
  # GET /usocials/new.json
  def new
    @usocial = Usocial.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @usocial }
      format.json  { render :json => @usocial }
    end
  end
  
  # GET /usocials/:id/edit
  def edit
  end
  
  # POST /usocials
  # POST /usocials.js
  # POST /usocials.xml
  # POST /usocials.json
  def create
    @usocial = Usocial.new(params[:usocial])
    
    respond_to do |format|
      if @usocial.save
        flash[:notice] = "Usocial was successfully created."
        format.html { redirect_to(@usocial) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @usocial, :status => :created, :location => @usocial }
        format.json  { render :json => @usocial, :status => :created, :location => @usocial }
      else
        flash[:error] = "Usocial could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @usocial.errors, :status => :unprocessable_entity }
        format.json  { render :json => @usocial.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /usocials/:id
  # PUT /usocials/:id.js
  # PUT /usocials/:id.xml
  # PUT /usocials/:id.json
  def update
    respond_to do |format|
      if @usocial.update_attributes(params[:usocial])
        flash[:notice] = "Usocial was successfully updated."
        format.html { redirect_to(@usocial) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Usocial could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @usocial.errors, :status => :unprocessable_entity }
        format.json  { render :json => @usocial.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /usocials/:id
  # DELETE /usocials/:id.js
  # DELETE /usocials/:id.xml
  # DELETE /usocials/:id.json
  def destroy
    respond_to do |format|
      if @usocial.destroy
        flash[:notice] = "Usocial was successfully destroyed."
        format.html { redirect_to(usocials_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Usocial could not be destroyed."
        format.html { redirect_to(usocial_url(@usocial)) }
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
      @collection = @usocials ||= Usocial.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @usocial ||= Usocial.find(params[:id])
    end
    alias :load_resource :resource
    
end