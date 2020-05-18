module SessionsHelper
  # creates a session for the current user
  def log_in(user)
    session[:user_id] = user.id
  end
end
