class WelcomeController < ApplicationController

  def index
  end

  def local_photos
    @data = DataGetter.new
  end

end
