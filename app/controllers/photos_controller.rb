class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def create

    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path
    end
  end

  def local
      @data = DataGetter.new
    if params[:searchterm]
      @searchterm = params[:searchterm].gsub(" ","").gsub("#","")
      @viewdata = @data.search_by_tag(current_user.token, @searchterm)
    else
      @searchterm = "denver"
      @viewdata = @data.search_by_tag(current_user.token, @searchterm)
    end
  end


  private

  def photo_params
    params.require(:photo).permit(:url)
  end

end
