class InterestsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /interests
  # GET /interests.js
  # GET /interests.xml
  # GET /interests.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @interests }
      format.json  { render :json => @interests }
    end
  end
  
  # GET /interests/:id
  # GET /interests/:id.js
  # GET /interests/:id.xml
  # GET /interests/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @interests }
      format.json  { render :json => @interests }
    end
  end
  
  # GET /interests/new
  # GET /interests/new.js
  # GET /interests/new.xml
  # GET /interests/new.json
  def new
    @interest = Interest.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @interest }
      format.json  { render :json => @interest }
    end
  end
  
  # GET /interests/:id/edit
  def edit
  end
  
  # POST /interests
  # POST /interests.js
  # POST /interests.xml
  # POST /interests.json
  def create
    @interest = Interest.new(params[:interest])
    
    respond_to do |format|
      if @interest.save
        flash[:notice] = "Interest was successfully created."
        format.html { redirect_to(@interest) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @interest, :status => :created, :location => @interest }
        format.json  { render :json => @interest, :status => :created, :location => @interest }
      else
        flash[:error] = "Interest could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
        format.json  { render :json => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /interests/:id
  # PUT /interests/:id.js
  # PUT /interests/:id.xml
  # PUT /interests/:id.json
  def update
    respond_to do |format|
      if @interest.update_attributes(params[:interest])
        flash[:notice] = "Interest was successfully updated."
        format.html { redirect_to(@interest) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Interest could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @interest.errors, :status => :unprocessable_entity }
        format.json  { render :json => @interest.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /interests/:id
  # DELETE /interests/:id.js
  # DELETE /interests/:id.xml
  # DELETE /interests/:id.json
  def destroy
    respond_to do |format|
      if @interest.destroy
        flash[:notice] = "Interest was successfully destroyed."
        format.html { redirect_to(interests_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Interest could not be destroyed."
        format.html { redirect_to(interest_url(@interest)) }
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
      @collection = @interests ||= Interest.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @interest ||= Interest.find(params[:id])
    end
    alias :load_resource :resource
    
end