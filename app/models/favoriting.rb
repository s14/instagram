class Favoriting < ActiveRecord::Base
  belongs_to(:photo)
  belongs_to(:user)
end
