class SongsController < ApplicationController
  
  def index
    if params[:search]
      @songs=Song.find(:all, :conditions=>['name LIKE ?', "%#{params[:search]}%"])
    else
      @songs=current_user.songs
    end
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
  
  def show
    @songs = Song.where(:user_id => current_user.id).newest
  end
  
  def destroy
      song=Song.find_by_id(params[:id])
      song.delete
      redirect_to songs_path
  end
end
