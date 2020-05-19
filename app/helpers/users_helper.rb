module UsersHelper
   # Returns true if the current user is following the other user.
   def following?(other_user)
    current_user.following.include?(other_user) if logged_in?
  end

  # Returns the avatar for the given user.
  def avatar_for(user, options = { size: 80 })
    size         = options[:size]
    image_tag user.photo_url(:thumb).to_s
  end
end
