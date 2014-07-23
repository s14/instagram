class User < ActiveRecord::Base
  validates :username, :uniqueness => true

  # has many own_photos (as owner)
  def own_photos
    return Photo.where({ :user_id => self.id })
  end

  # has many comments (as commenter)
  def comments
    return Comment.where({ :user_id => self.id })
  end

  # has many favoritings
  def favoritings
    return Favoriting.where({ :user_id => self.id })
  end

  # has many favorite_photos
  def favorite_photos
    return Photo.where({ :id => favoritings.pluck(:photo_id) })
  end

  # Hard part

  # has many followings_where_leader
  # has many followers

  # has many followings_where_follower
  # has many leaders
end
