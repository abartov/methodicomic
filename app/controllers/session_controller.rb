class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create
  def create
    @user = User.from_omniauth(auth_hash)
    #@user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    redirect_to '/', :notice => "Signed in!"
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "Signed out!"
  end
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
