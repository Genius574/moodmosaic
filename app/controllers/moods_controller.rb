class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    if @mood.save
      redirect_to moods_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:feeling, :user_id, :category_id)
  end 
end
