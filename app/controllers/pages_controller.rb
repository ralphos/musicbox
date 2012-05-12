class PagesController < ApplicationController

  def landing
    @songs = Song.order('created_at DESC').limit(5)
  end


  
  def get_song
    link = params[:link]
    @song = Song.new
    @song.link = link
    @song.save
    
    respond_to do |format|
      format.js
    end
  end
  
end

