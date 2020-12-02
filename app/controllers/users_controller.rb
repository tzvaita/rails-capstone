class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :show]
  before_action :correct_user,   only: [:edit, :update]

  # show all users
  def index
    @users = User.all
  end

  # show a single user
  def show
    @user = User.find(params[:id])
    @thoughts = @user.thoughts.order(created_at: :desc)
    @followers = @user.followers
  end

  # new user instance
  def new
    @user = User.new
  end

  # create a new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the App!"
      redirect_to home_path
    else
      flash[:errors] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private
  
  # allowed params
    def user_params
      params.require(:user).permit(:fullname, :username, :photo, :coverimage)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
end
