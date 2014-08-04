class Picture < ActiveRecord::Base
  validates :caption, :presence => true
end
