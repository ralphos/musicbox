class Song < ActiveRecord::Base
  attr_accessible :artist, :link, :name, :user_id
  
  has_many :playlists
  has_many :users, :through => :playlists
  
  scope :newest, order('created_at desc')
end
