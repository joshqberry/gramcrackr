class SessionsController < ApplicationController
  def create
    @user = User.where(uid: auth_hash[:uid], token: auth_hash['credentials']['token'], name: auth_hash['info']['name']).first_or_create
    session[:user_id] = @user.id
    redirect_to users_path, notice: "Hey, it worked!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
