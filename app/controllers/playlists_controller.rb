class PlaylistsController < ApplicationController
  
  def index
    @playlists = Playlist.order("created_at desc")
  end
  
  def show
  end
end
