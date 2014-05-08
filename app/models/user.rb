class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :inward_follows, class: 'Follow', foreign_key: 'followee_id'
  has_many :outward_follows, class: 'Follow', foreign_key: 'follower_id'

  has_many :followers, through: :inward_follows, source: :follower
  has_many :followees, through: :outward_follows, source: :followee
end
