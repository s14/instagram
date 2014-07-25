class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
    return Photo.where({ :id => self.favoritings.pluck(:photo_id) })
  end

  # has many followings_where_leader
  def followings_where_leader
    return Following.where({ :leader_id => self.id })
  end

  # has many followers
  def followers
    return User.where({ :id => self.followings_where_leader.pluck(:follower_id) })
  end

  # has many followings_where_follower
  def followings_where_follower
    return Following.where({ :follower_id => self.id })
  end

  # has many leaders
  def leaders
    return User.where({ :id => self.followings_where_follower.pluck(:leader_id) })
  end

  # Homework

  def timeline
    # This method should return all the photos that belong to
    #   my leaders (users that I follow)
    return Photo.where({ :user_id => self.leaders.pluck(:id) })
  end

  # CHALLENGE
  def timeline_including_favorites
    # I like Rose's idea from the end of class. This method should
    #   return my leaders' own photos plus photos that my leaders
    #   have favorited as well.

    leaders_own_photos_ids = self.timeline.pluck(:id)
    leaders_favorite_photos_ids = Favoriting.where({ :user_id => self.leaders.pluck(:id) }).pluck(:photo_id)

    photo_id_array = leaders_own_photos_ids + leaders_favorite_photos_ids

    return Photo.where({ :id => photo_id_array })
  end
end








