# == Schema Information
#
# Table name: playlists
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  song_id    :integer
#  title      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Playlist < ActiveRecord::Base
  attr_accessible :title, :user_id, :song_id
  
  belongs_to :user
  belongs_to :song
end
