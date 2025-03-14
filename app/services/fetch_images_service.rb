class FetchImagesService
  def self.fetch_images_by_mood(mood)
    Unsplash::Photo.search(mood, per_page: 10)
  end
end
