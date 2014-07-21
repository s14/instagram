class Photo < ActiveRecord::Base
  # belongs to one user (the owner)
  # has many comments
  # has many favoritings
  # has many fans
end
