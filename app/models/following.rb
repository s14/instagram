class Following < ActiveRecord::Base
  validates :leader_id, :uniqueness => { :scope => :follower_id }

  belongs_to(:leader, { :class_name => "User" })
  belongs_to(:follower, { :class_name => "User" })
end
