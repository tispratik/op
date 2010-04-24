class UprofilesController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /uprofiles
  # GET /uprofiles.js
  # GET /uprofiles.xml
  # GET /uprofiles.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @uprofiles }
      format.json  { render :json => @uprofiles }
    end
  end
  
  # GET /uprofiles/:id
  # GET /uprofiles/:id.js
  # GET /uprofiles/:id.xml
  # GET /uprofiles/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @uprofiles }
      format.json  { render :json => @uprofiles }
    end
  end
  
  # GET /uprofiles/new
  # GET /uprofiles/new.js
  # GET /uprofiles/new.xml
  # GET /uprofiles/new.json
  def new
    @uprofile = Uprofile.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @uprofile }
      format.json  { render :json => @uprofile }
    end
  end
  
  # GET /uprofiles/:id/edit
  def edit
  end
  
  # POST /uprofiles
  # POST /uprofiles.js
  # POST /uprofiles.xml
  # POST /uprofiles.json
  def create
    @uprofile = Uprofile.new(params[:uprofile])
    
    respond_to do |format|
      if @uprofile.save
        flash[:notice] = "Uprofile was successfully created."
        format.html { redirect_to(@uprofile) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @uprofile, :status => :created, :location => @uprofile }
        format.json  { render :json => @uprofile, :status => :created, :location => @uprofile }
      else
        flash[:error] = "Uprofile could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @uprofile.errors, :status => :unprocessable_entity }
        format.json  { render :json => @uprofile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /uprofiles/:id
  # PUT /uprofiles/:id.js
  # PUT /uprofiles/:id.xml
  # PUT /uprofiles/:id.json
  def update
    respond_to do |format|
      if @uprofile.update_attributes(params[:uprofile])
        flash[:notice] = "Uprofile was successfully updated."
        format.html { redirect_to(@uprofile) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Uprofile could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @uprofile.errors, :status => :unprocessable_entity }
        format.json  { render :json => @uprofile.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /uprofiles/:id
  # DELETE /uprofiles/:id.js
  # DELETE /uprofiles/:id.xml
  # DELETE /uprofiles/:id.json
  def destroy
    respond_to do |format|
      if @uprofile.destroy
        flash[:notice] = "Uprofile was successfully destroyed."
        format.html { redirect_to(uprofiles_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Uprofile could not be destroyed."
        format.html { redirect_to(uprofile_url(@uprofile)) }
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
      @collection = @uprofiles ||= Uprofile.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @uprofile ||= Uprofile.find(params[:id])
    end
    alias :load_resource :resource
    
end