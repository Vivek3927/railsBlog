class OmniauthController < ApplicationController
  def facebook
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = "There was problem..?"
      redirect_to new_user_registration_url
    end
  end
  def github
    @user = User.create_from_github_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = "There was a problem...?"
      redirect_to new_user_registration_url
    end
  end
  def google_oauth2
    @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
    else
      flash[:error] = "There was a problem.....?"
      redirect_to new_user_registration_url
    end
  end
  def failure
    flash[:error] = "There was a problem"
    redirect_to new_user_registration_url
  end

end 
