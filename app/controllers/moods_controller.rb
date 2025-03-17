class MoodsController < ApplicationController
  def index
    @moods = current_user.moods.includes(:category).order(created_at: :desc)
  end

  def new
    @mood = Mood.new
  end

  def create
    @mood = Mood.new(mood_params)
    @mood.user = current_user
    if @mood.save
      # ActivityLog.create!(user: current_user, mood: @mood, action: "Mood selected")
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
    category = Category.find_by(name: params[:mood][:category])
    @mood.category = category
    if @mood.save!
      # ActivityLog.create!(user: current_user, mood: @mood, category: @mood.category, action: "Selected category")
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
