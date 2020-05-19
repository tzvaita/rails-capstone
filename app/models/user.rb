class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  mount_uploader :coverimage, CoverimageUploader
  has_many :active_followings, class_name:  'Following',
                                  foreign_key: 'follower_id',
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Following",
                                    foreign_key: "followed_id",
                                    dependent:   :destroy

  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_relationships
  has_many :thoughts, foreign_key: 'author_id'

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
