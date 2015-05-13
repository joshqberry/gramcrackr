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

  private

  def photo_params
    params.require(:photo).permit(:url)
  end

end
