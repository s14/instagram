class Favoriting < ActiveRecord::Base
  # belongs to one photo
  def photo
    return Photo.find_by({ :id => self.photo_id })
  end

  # belongs to one user
  def user
    return User.find_by({ :id => self.user_id })
  end
end
