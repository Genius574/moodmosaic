require_dependency 'spotify_service'
class ContentsController < ApplicationController
  def index
    @mood = current_user.moods.order(updated_at: :asc).last
    @blogs = Content.where(category_id: @mood.category.id, content_type: "blogs")
    @quotes = Content.where(category_id: @mood.category.id, content_type: "quote")
    @spotify_service = SpotifyService.new(@mood)
    @songs = @spotify_service.fetch_playlists
    @all_content = []
    @blogs.each do |blog|
      @all_content << blog
    end
    @quotes.each do |quote|
      @all_content << quote
    end
    @songs.each do |song|
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
