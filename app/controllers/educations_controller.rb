class EducationsController < ApplicationController
  
  before_filter :load_resource, :only => [:show, :edit, :update, :destroy]
  before_filter :load_and_paginate_resources, :only => [:index]
  
  # GET /educations
  # GET /educations.js
  # GET /educations.xml
  # GET /educations.json
  def index
    respond_to do |format|
      format.html # index.html.haml
      format.js   # index.js.rjs
      format.xml  { render :xml => @educations }
      format.json  { render :json => @educations }
    end
  end
  
  # GET /educations/:id
  # GET /educations/:id.js
  # GET /educations/:id.xml
  # GET /educations/:id.json
  def show
    respond_to do |format|
      format.html # show.html.haml
      format.js   # show.js.rjs
      format.xml  { render :xml => @educations }
      format.json  { render :json => @educations }
    end
  end
  
  # GET /educations/new
  # GET /educations/new.js
  # GET /educations/new.xml
  # GET /educations/new.json
  def new
    @education = Education.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.js   # new.js.rjs
      format.xml  { render :xml => @education }
      format.json  { render :json => @education }
    end
  end
  
  # GET /educations/:id/edit
  def edit
  end
  
  # POST /educations
  # POST /educations.js
  # POST /educations.xml
  # POST /educations.json
  def create
    @education = Education.new(params[:education])
    
    respond_to do |format|
      if @education.save
        flash[:notice] = "Education was successfully created."
        format.html { redirect_to(@education) }
        format.js   # create.js.rjs
        format.xml  { render :xml => @education, :status => :created, :location => @education }
        format.json  { render :json => @education, :status => :created, :location => @education }
      else
        flash[:error] = "Education could not be created."
        format.html { render 'new' }
        format.js   # create.js.rjs
        format.xml  { render :xml => @education.errors, :status => :unprocessable_entity }
        format.json  { render :json => @education.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # PUT /educations/:id
  # PUT /educations/:id.js
  # PUT /educations/:id.xml
  # PUT /educations/:id.json
  def update
    respond_to do |format|
      if @education.update_attributes(params[:education])
        flash[:notice] = "Education was successfully updated."
        format.html { redirect_to(@education) }
        format.js   # update.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Education could not be updated."
        format.html { render 'edit' }
        format.js   # update.js.rjs
        format.xml  { render :xml => @education.errors, :status => :unprocessable_entity }
        format.json  { render :json => @education.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /educations/:id
  # DELETE /educations/:id.js
  # DELETE /educations/:id.xml
  # DELETE /educations/:id.json
  def destroy
    respond_to do |format|
      if @education.destroy
        flash[:notice] = "Education was successfully destroyed."
        format.html { redirect_to(educations_url) }
        format.js   # destroy.js.rjs
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        flash[:error] = "Education could not be destroyed."
        format.html { redirect_to(education_url(@education)) }
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
      @collection = @educations ||= Education.paginate(paginate_options)
    end
    alias :load_and_paginate_resources :collection
    
    def resource
      @resource = @education ||= Education.find(params[:id])
    end
    alias :load_resource :resource
    
end