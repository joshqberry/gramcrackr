class WelcomeController < ApplicationController

  def index
  end

  def local_photos
      @data = DataGetter.new
    if params[:searchterm]
      @searchterm = params[:searchterm]
      @viewdata = @data.search_by_tag(current_user.token, @searchterm)
    else
      @searchterm = "denver"
      @viewdata = @data.search_by_tag(current_user.token, @searchterm)
    end
  end

end
