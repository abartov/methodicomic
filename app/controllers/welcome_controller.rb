class WelcomeController < ApplicationController
  def login
    redirect_to '/auth/google_oauth2'
  end

  def index
  end
end
