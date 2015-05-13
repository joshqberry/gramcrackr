class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to root_url
    else
      notice: 'failure'
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:user_id, :url)
  end

end
