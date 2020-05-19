module UsersHelper
   # Returns true if the current user is following the other user.
   def following?(other_user)
    current_user.following.include?(other_user) if logged_in?
  end
end
