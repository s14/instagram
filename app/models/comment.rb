class Comment < ActiveRecord::Base
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :photo_id, :presence => true

  # belongs to one photo
  # belongs to one user
end
