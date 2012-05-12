class Song < ActiveRecord::Base
  attr_accessible :artist, :link, :name
  
  has_many :playlists
  has_many :users, :through => :playlists
  
  scope :newest, order('created_at desc')
end
