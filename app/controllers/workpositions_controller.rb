class WorkpositionsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /workpositions
  # GET /workpositions.js
  # GET /workpositions.xml
  # GET /workpositions.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @workpositions }
      format.json  { render :json => @workpositions }
    end
  end
  
  # GET /workpositions/:id
  # GET /workpositions/:id.js
  # GET /workpositions/:id.xml
  # GET /workpositions/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @workpositions }
      format.json  { render :json => @workpositions }
    end
  end
  
  # GET /workpositions/new
  # GET /workpositions/new.js
  # GET /workpositions/new.xml
  # GET /workpositions/new.json
  def new
    @workposition = Workposition.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @workposition }
      format.json  { render :json => @workposition }
    end
  end
  
  # GET /workpositions/:id/edit
  def edit
  end
  
  # POST /workpositions
  # POST /workpositions.js
  # POST /workpositions.xml
  # POST /workpositions.json
  def create
    @workposition = Workposition.new(params[:workposition])
    
    respond_to do |format|
      if @workposition.save
        flash[:notice] = "Workposition was successfully created."
        format.html { redirect_to(@workposition) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @workposition, :status => :created, :location => @workposition }
        format.json  { render :json => @workposition, :status => :created, :location => @workposition }
      else
        flash[:error] = "Workposition could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @workposition.errors, :status => :unprocessable_entity }
        format.json  { render :json => @workposition.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /workpositions/:id
  # PUT /workpositions/:id.js
  # PUT /workpositions/:id.xml
  # PUT /workpositions/:id.json
  def update
    respond_to do |format|
      if @workposition.update_attributes(params[:workposition])
        flash[:notice] = "Workposition was successfully updated."
        format.html { redirect_to(@workposition) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Workposition could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @workposition.errors, :status => :unprocessable_entity }
        format.json  { render :json => @workposition.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /workpositions/:id
  # DELETE /workpositions/:id.js
  # DELETE /workpositions/:id.xml
  # DELETE /workpositions/:id.json
  def destroy
    respond_to do |format|
      if @workposition.destroy
        flash[:notice] = "Workposition was successfully destroyed."
        format.html { redirect_to(workpositions_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Workposition could not be destroyed."
        format.html { redirect_to(workposition_url(@workposition)) }
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
      @collection = @workpositions ||= Workposition.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @workposition ||= Workposition.find(params[:id])
    end
    alias :load_resource :resource
    
end