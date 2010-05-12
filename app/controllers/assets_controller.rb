class AssetsController < ApplicationController
  
  before_filter :login_required
  before_filter :find_asset, :except => [:index, :new, :create]
  
  def index
    @asset = Asset.new
    @assets = Asset.all
  end
  
  def destroy
    @asset.destroy
    flash[:notice] = "File deleted."
    redirect_to :back
  end
  
  def show
    send_file @asset.data.path(params[:style]), :type => @asset.data_content_type, :disposition => 'inline'
  end
  
  def create
    @asset = Asset.build(params[:asset][:assets])
    #alias field is non mandatory
    
    if @asset.save
      flash[:notice] = 'File uploaded successfully.'
      redirect_to :back
    else
      flash[:notice] = 'Failed to upload file.'
      flash[:errors] = @asset.errors.full_messages.join('<br />')
      redirect_to :back
    end
  end
  
  private
  
  def find_asset
    @asset = Asset.find(params[:id])
  end

end
