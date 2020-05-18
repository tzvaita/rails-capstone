class UsersController < ApplicationController
  # show all users
  def index
    @users = User.all
  end

  # show a single user
  def show
    @user = User.find(params[:id])
  end

  # new user instance
  def new
    @user = User.new
  end

  # create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  
  # allowed params
    def user_params
      params.require(:user).permit(:fullname, :username)
    end
end
