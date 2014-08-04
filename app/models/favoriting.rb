class Favoriting < ActiveRecord::Base
  validates :photo, :presence => true, :uniqueness => { :scope => :user }
  validates :user, :presence => true

  belongs_to :photo
  belongs_to :user
end
