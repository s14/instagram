class Following < ActiveRecord::Base
  validates :leader, :presence => true, :uniqueness => { :scope => :follower }
  validates :follower, :presence => true

  belongs_to :leader, :class_name => "User"
  belongs_to :follower, :class_name => "User"
end
