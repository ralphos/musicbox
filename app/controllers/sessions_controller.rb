class SessionsController < ApplicationController

  def new_twitter
    redirect_to '/auth/twitter'
  end
  
  def new_facebook
    redirect_to '/auth/facebook'
  end
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'], 
                      :uid => auth['uid']).first || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to songs_url, :notice => "Signed in!"
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => 'Signed out!'
  end
  
  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end
  
end
