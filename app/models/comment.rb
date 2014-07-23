class Comment < ActiveRecord::Base
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :photo_id, :presence => true

  # belongs to one photo
  def photo
    return Photo.find_by({ :id => self.photo_id })
  end

  # belongs to one user
  def user
    return User.find_by({ :id => self.user_id })
  end
end
