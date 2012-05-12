require 'open-uri'
require 'json'

class SongsController < ApplicationController
  
  def index
    @songs = current_user.songs
  end
  
  def new
    @song = Song.new
  end
  
  def create
    @song = Song.create(params[:song])
    
    @playlist = Playlist.find_by_title(params[:playlist])
    if @playlist.nil?
      #Create a new playlist
      playlist = Playlist.create(:user_id => current_user.id, :title => params[:playlist])
      
      playlist.songs << @song
    else
      @playlist.songs << @song
    end
  
    if @song.save
      redirect_to '/songs', notice: "Song added!"
    else
      render :back, notice: "Sorry we couldn't add your song."
    end
  end
  
  def show
    @songs = Song.where(:user_id => current_user.id).newest
  end
  
  def search
    @q = params[:search]
    access_token = "30481e86e78f0aee64e78765c33c4ef6"
    
    @results = JSON.parse(open("http://tinysong.com/s/#{@q}?format=json&limit=10&key=#{access_token}").read)
  
  end    
end
