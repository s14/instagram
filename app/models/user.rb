class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, :uniqueness => true

  # has many own_photos (as owner)
  # has many comments (as commenter)
  # has many favoritings
  # has many favorite_photos
  # has many followings_where_leader
  # has many followers
  # has many followings_where_follower
  # has many leaders

  # Homework

  def timeline
    # This method should return all the photos that belong to
    #   my leaders (users that I follow)
  end

  # CHALLENGE
  def timeline_including_favorites
    # I like Rose's idea from the end of class. This method should
    #   return my leaders' own photos plus photos that my leaders
    #   have favorited as well.
  end
end








