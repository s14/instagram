class Photo < ActiveRecord::Base

  validates :caption, :presence => true

  mount_uploader :photo_file, PhotoFileUploader

  # belongs to one user (the owner)
  def owner
    return User.find_by({ :id => self.user_id })
  end

  # has many comments
  def comments
    return Comment.where({ :photo_id => self.id })
  end

  # has many favoritings
  def favoritings
    return Favoriting.where({ :photo_id => self.id })
  end

  # has many fans
  def fans
    return User.where({ :id => self.favoritings.pluck(:user_id) })
  end
end











