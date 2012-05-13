require 'open-uri'
require 'json'

class SongsController < ApplicationController
  
  include SongsHelper
  
  def index    
    if params[:search]
      @songs=Song.find(:all, :conditions=>['name LIKE ?', "%#{params[:search]}%"])
    else
      @songs = current_user.songs.order('created_at DESC')
    end
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
      redirect_to '/songs/new', notice: "Sorry we couldn't add your song."
    end
  end
  
  def show
    @songs = Song.where(:user_id => current_user.id).newest
  end
  

  def search
    @q = params[:search]
    @q = @q.gsub(' ', '%20')
    access_token = "30481e86e78f0aee64e78765c33c4ef6"
    
    @results = JSON.parse(open("http://tinysong.com/s/#{@q}?format=json&limit=10&key=#{access_token}").read)
  
  end    

  def destroy
      song=Song.find_by_id(params[:id])
      song.delete
      redirect_to songs_path
  end
  
  def feed
    @feed_items = current_user.feed
  end
  
  def play
    songs_unsorted = current_user.songs.order('created_at DESC')
    @songs = get_grooveshark_songs(songs_unsorted)
  end

end
