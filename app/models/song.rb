# == Schema Information
#
# Table name: songs
#
#  id         :integer         not null, primary key
#  artist     :string(255)
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  song       :string(255)
#  user_id    :integer
#

class Song < ActiveRecord::Base
  attr_accessible :artist, :link, :name, :user_id
  
  has_and_belongs_to_many :playlists
  belongs_to :user
  
  scope :newest, order('created_at desc')
end
