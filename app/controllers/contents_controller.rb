class ContentsController < ApplicationController
  def index
    @mood = current_user.moods.order(updated_at: :asc).last
    @contents = Content.where(category_id: @mood.category.id)

  end

  def show
    @content = Content.find(params[:id])
  end
end
