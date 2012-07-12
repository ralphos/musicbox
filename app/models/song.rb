class Song < ActiveRecord::Base
  attr_accessible :artist, :link, :name
  
  has_many :playlists
  has_many :users, :through => :playlists
  
  scope :newest, order('created_at desc')
end
# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  artist     :string(255)
#  name       :string(255)
#  link       :string(255)
#  user_id    :integer
#  tag        :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

