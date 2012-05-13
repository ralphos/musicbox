# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  pic        :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :provider, :uid, :pic
  
  has_many :playlists
  has_many :songs
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                     class_name:  "Relationship",
                                     dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  
  def following?(other_user)
      relationships.find_by_followed_id(other_user.id)
    end

  def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
   end
    
  def unfollow!(other_user)
        relationships.find_by_followed_id(other_user.id).destroy
    end
    
  
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.pic = auth['info']['image'] || ""
      end
    end
  end
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end

