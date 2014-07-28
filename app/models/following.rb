class Following < ActiveRecord::Base
  validates :leader_id, :uniqueness => { :scope => :follower_id }

  # belongs to one leader
  def leader
    return User.find_by({ :id => self.leader_id })
  end

  # belongs to one follower
  def follower
    return User.find_by({ :id => self.follower_id })
  end
end
