class User < ActiveRecord::Base
  validates :username, :uniqueness => true

  # has many own_photos (as owner)
  # has many comments (as commenter)
  # has many favoritings
  # has many favorite_photos

  # Hard part

  # has many followings_where_leader
  # has many followers

  # has many followings_where_follower
  # has many leaders
end
