class UsersController < ApplicationController
  
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
end
