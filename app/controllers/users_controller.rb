class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    if params[:search]
      @playlists=Playlist.find(:all, :conditions=>['title LIKE ?', "%#{params[:search]}%"])
    else
      @playlists = @user.playlists
    end  
  end
  
  def index
   if params[:search]
      @users=User.find(:all, :conditions=>['name LIKE ?', "%#{params[:search]}%"])
    else
      @users = User.order('created_at desc')
    end
  end
  
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
