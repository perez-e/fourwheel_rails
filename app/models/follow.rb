class Follow < ActiveRecord::Base
  belongs_to :followee, class: 'User'
  belongs_to :follower, class: 'User'
end
