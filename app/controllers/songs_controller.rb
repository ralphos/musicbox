class SongsController < ApplicationController
  
  def index
    @songs = Song.where(:user_id => current_user.id).newest
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to '/songs', notice: "Song added!"
    else
      render :back, notice: "Sorry we couldn't add your song."
    end
  end
end
