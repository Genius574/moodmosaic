require_dependency 'spotify_service'

class ContentsController < ApplicationController
  def index
    @mood = current_user.current_mood
    @contents = Content.where(category_id: @mood.category.id)
    # LATER - use chat to generate blog titles

    @spotify_service = SpotifyService.new(@mood)
    @songs = @spotify_service.fetch_playlists

    @all_content = []
    @contents.each do |blog|
      @all_content << blog
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
