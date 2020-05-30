class ThoughtsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @thought = current_user.thoughts.build(thought_params)
    if @thought.save
      flash[:success] = "Thought created!"
      redirect_to home_url
    else
      flash[:danger] = "Thought cannot be empty"
      redirect_to home_url
    end
  end

  def destroy
  end

  private

    def thought_params
      params.require(:thought).permit(:text)
    end

    def correct_user
      @thought = current_user.thoughts.find_by(id: params[:id])
      redirect_to root_url if @thought.nil?
    end
end
