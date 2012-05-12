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
    @users = User.all
  end
end
