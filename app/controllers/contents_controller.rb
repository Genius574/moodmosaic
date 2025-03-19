require_dependency 'spotify_service'
class ContentsController < ApplicationController
  def index
    @mood = current_user.moods.order(updated_at: :asc).last
    @blogs = Content.where(category_id: @mood.category.id, content_type: "blogs")
    @quotes = Content.where(category_id: @mood.category.id, content_type: "quote")

    @photos = []
    4.times do
      photo = Content.create(mood_id: @mood.id, category_id: @mood.category.id, content_type: "image")
      photo.set_photo
      @photos << photo
    end
    @spotify_service = SpotifyService.new(@mood)
    @songs = @spotify_service.fetch_playlists

    @all_content = []
    @blogs.each do |blog|
      @all_content << blog
    end
    @photos.each do |photo|
      @all_content << photo
    end
    @quotes.each do |quote|
      @all_content << quote
    end
    @songs[0..3].each do |song|
      @all_content << song
    end
    @all_content.shuffle!
  end

  def show
    @content = Content.find(params[:id])
    # call the blog method
    @content.blog
  end
end
