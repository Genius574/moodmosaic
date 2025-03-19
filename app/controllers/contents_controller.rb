require_dependency 'spotify_service'
class ContentsController < ApplicationController
  def index
    @mood = current_user.moods.order(updated_at: :asc).last
    @blogs = Content.where(category_id: @mood.category.id, content_type: "blog")
    @quotes = Content.where(category_id: @mood.category.id, content_type: "quote")

    @photos = Content.where(category_id: @mood.category.id, content_type: "image")

    @spotify_service = SpotifyService.new(@mood)
    @songs = @spotify_service.fetch_playlists

    @filter = params[:filter]
    @all_content = case @filter
                   when 'blog'
                     @blogs
                   when 'image'
                     @photos
                   when 'quote'
                     @quotes
                   when 'spotify'
                     @songs
                   else
                     # Default: show all content
                     [].tap do |content|
                       content.concat(@blogs)
                       content.concat(@photos)
                       content.concat(@quotes)
                       content.concat(@songs[0..3])
                     end.shuffle!
                   end
  end

  def show
    @content = Content.find(params[:id])
    # call the blog method
    @content.blog
  end
end
