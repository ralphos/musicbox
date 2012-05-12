class Playlist < ActiveRecord::Base
  attr_accessible :title, :user_id, :song_id
  
  belongs_to :user
  belongs_to :song
end
