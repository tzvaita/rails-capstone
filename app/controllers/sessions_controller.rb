class SessionsController < ApplicationController
  # instantiates a new session
  def new
  end

  # create a new session
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username'
      render 'new'
    end
  end

  # logs out user
  def destroy
    log_out
    redirect_to root_url
  end
end
