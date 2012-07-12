class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @playlists = @user.playlists
  end
end
