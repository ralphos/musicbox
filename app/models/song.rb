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
  
  has_many :playlists
  has_many :users, :through => :playlists
  
  scope :newest, order('created_at desc')
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
end
