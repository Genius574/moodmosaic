class MoodsController < ApplicationController
  def index
    @moods = current_user.moods.includes(:category).order(created_at: :desc)
  end

  def new
    @moods = []
    @happy_mood = Mood.new(feeling: 'happy')
    @moods << @happy_mood
    @meh_mood = Mood.new(feeling: 'meh')
    @moods << @meh_mood
    @sad_mood = Mood.new(feeling: 'sad')
    @moods << @sad_mood
    @moods
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
    @categories = []
    @uplifting_category = Category.find_by(name: 'Uplifting')
    @categories << @uplifting_category

    @emotional_category = Category.find_by(name: 'Emotional')
    @categories << @emotional_category

    @calming_category = Category.find_by(name: 'Calming')
    @categories << @calming_category

    @serious_category = Category.find_by(name: 'Serious')
    @categories << @serious_category
    @categories
  end

  def update
    @mood = Mood.find(params[:id])
    category = Category.find(params[:mood][:category])
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
