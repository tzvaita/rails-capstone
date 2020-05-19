class ThoughtsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
    @thought = current_user.thoughts.build(thought_params)
    if @thought.save
      flash[:success] = "Thought created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def thought_params
      params.require(:thought).permit(:text)
    end
end
