class PlaylistsController < ApplicationController
  
  def index
    @playlists = Playlist.order("created_at desc")
  end
  
  def show
    playlist = Playlist.find_by_id(params[:id])
    @songs = playlist.songs
  end
end
