class StaticPagesController < ApplicationController
  def home
    @thought = current_user.thoughts.build if logged_in?
    @thoughts = Thought.all.order(created_at: :desc)
    @users = User.all.order(created_at: :desc)
  end
end
