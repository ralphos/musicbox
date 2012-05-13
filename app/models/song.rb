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
  
  default_scope order: 'songs.created_at DESC'

  # Returns songs from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }
  
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
  def self.from_users_followed_by(user)
      followed_user_ids = user.followed_user_ids.join(', ')
      where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end
  
  private

  # Returns an SQL condition for users followed by the given user.
  # We include the user's own id as well.
  
  def self.followed_by(user)
       followed_user_ids = %(SELECT followed_id FROM relationships
                          WHERE follower_id = :user_id)
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          { user_id: user })
  end
  
    
end
