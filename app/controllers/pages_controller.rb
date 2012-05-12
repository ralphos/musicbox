class PagesController < ApplicationController

  def landing
  end


  
  def get_song
    @link = params[:link]
  end
  
end

