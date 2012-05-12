class SongsController < ApplicationController
  
  def index
    @songs = Song.where(:user_id => current_user.id).newest
  end
end
