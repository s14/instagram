class Comment < ActiveRecord::Base
  validates :content, :presence => true
  validates :user, :presence => true
  validates :photo, :presence => true

  belongs_to :photo
  belongs_to :user
end
