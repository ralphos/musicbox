class PlaylistsController < ApplicationController
  
  before_filter :authenticate_user!
  
  include SongsHelper
  
  def index
    @playlists = Playlist.order("created_at desc")
  end
  
  def show
    @playlist = Playlist.find_by_id(params[:id])
    @songs = @playlist.songs
    @songs_string = get_grooveshark_songs(@songs)
  end
end
