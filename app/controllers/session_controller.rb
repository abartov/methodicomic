class SessionController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => :create
  def create
    @user = User.where(:provider => auth['provider'], :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = @user.id
    redirect_to '/', :notice => "Signed in!"
  end
  def destroy
    session[:user_id] = nil
    redirect_to '/', :notice => "Signed out!"
  end
  protected

  def auth
    request.env['omniauth.auth']
  end
end
