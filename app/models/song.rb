class Song < ActiveRecord::Base
  attr_accessible :artist, :link, :name, :user_id, :tag
  belongs_to :user
  
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

