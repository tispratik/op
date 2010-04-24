class UcontactsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /ucontacts
  # GET /ucontacts.js
  # GET /ucontacts.xml
  # GET /ucontacts.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @ucontacts }
      format.json  { render :json => @ucontacts }
    end
  end
  
  # GET /ucontacts/:id
  # GET /ucontacts/:id.js
  # GET /ucontacts/:id.xml
  # GET /ucontacts/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @ucontacts }
      format.json  { render :json => @ucontacts }
    end
  end
  
  # GET /ucontacts/new
  # GET /ucontacts/new.js
  # GET /ucontacts/new.xml
  # GET /ucontacts/new.json
  def new
    @ucontact = Ucontact.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @ucontact }
      format.json  { render :json => @ucontact }
    end
  end
  
  # GET /ucontacts/:id/edit
  def edit
  end
  
  # POST /ucontacts
  # POST /ucontacts.js
  # POST /ucontacts.xml
  # POST /ucontacts.json
  def create
    @ucontact = Ucontact.new(params[:ucontact])
    
    respond_to do |format|
      if @ucontact.save
        flash[:notice] = "Ucontact was successfully created."
        format.html { redirect_to(@ucontact) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @ucontact, :status => :created, :location => @ucontact }
        format.json  { render :json => @ucontact, :status => :created, :location => @ucontact }
      else
        flash[:error] = "Ucontact could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @ucontact.errors, :status => :unprocessable_entity }
        format.json  { render :json => @ucontact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /ucontacts/:id
  # PUT /ucontacts/:id.js
  # PUT /ucontacts/:id.xml
  # PUT /ucontacts/:id.json
  def update
    respond_to do |format|
      if @ucontact.update_attributes(params[:ucontact])
        flash[:notice] = "Ucontact was successfully updated."
        format.html { redirect_to(@ucontact) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Ucontact could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @ucontact.errors, :status => :unprocessable_entity }
        format.json  { render :json => @ucontact.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /ucontacts/:id
  # DELETE /ucontacts/:id.js
  # DELETE /ucontacts/:id.xml
  # DELETE /ucontacts/:id.json
  def destroy
    respond_to do |format|
      if @ucontact.destroy
        flash[:notice] = "Ucontact was successfully destroyed."
        format.html { redirect_to(ucontacts_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Ucontact could not be destroyed."
        format.html { redirect_to(ucontact_url(@ucontact)) }
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
      @collection = @ucontacts ||= Ucontact.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @ucontact ||= Ucontact.find(params[:id])
    end
    alias :load_resource :resource
    
end