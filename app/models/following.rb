class Following < ActiveRecord::Base
  # belongs to one leader
  def leader
    return User.find_by({ :id => self.leader_id })
  end

  # belongs to one follower
  def follower
    return User.find_by({ :id => self.follower_id })
  end
end
