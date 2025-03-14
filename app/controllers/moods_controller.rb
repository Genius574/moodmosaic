class MoodsController < ApplicationController
  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    # @mood.category_id = 0
    if @mood.save
      redirect_to edit_mood_path(@mood)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def update
    @mood = Mood.find(params[:id])

    if @mood = Mood.update(mood_params)
      redirect_to contents_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def mood_params
    params.require(:mood).permit(:feeling, :category_id)
  end
end
