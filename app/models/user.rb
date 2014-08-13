class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates :username, :uniqueness => true, :presence => true

  has_many :own_photos, :class_name => "Photo", :foreign_key => "user_id"
  has_many :comments

  has_many :favoritings
  has_many :favorite_photos, :through => :favoritings, :source => :photo

  has_many :followings_where_leader, :class_name => "Following", :foreign_key => "leader_id"
  has_many :followers, :through => :followings_where_leader

  has_many :followings_where_follower, :class_name => "Following", :foreign_key => "follower_id"
  has_many :leaders, :through => :followings_where_follower

  has_many :timeline, :through => :leaders, :source => :own_photos
  has_many :leaders_favorites, :through => :leaders, :source => :favorite_photos


  # CHALLENGE
  def timeline_including_favorites
    # I like Rose's idea from the end of class. This method should
    #   return my leaders' own photos plus photos that my leaders
    #   have favorited as well.

    leaders_own_photos_ids = self.timeline.pluck(:id)
    leaders_favorite_photos_ids = self.leaders_favorites.pluck(:id)

    photo_id_array = leaders_own_photos_ids + leaders_favorite_photos_ids

    return Photo.where({ :id => photo_id_array })
  end
end








