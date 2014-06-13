class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inward_follows, class_name: 'Follow', foreign_key: 'following_id'
  has_many :outward_follows, class_name: 'Follow', foreign_key: 'follower_id'

  has_many :followers, through: :inward_follows, source: :follower
  has_many :followings, through: :outward_follows, source: :followee

  has_many :comments
  has_many :posts
  has_many :routes
  
end
