class SpotifyService
  def initialize(mood)
    @mood = mood
  end

  def fetch_playlists
    results = RSpotify::Playlist.search("songs for a #{@mood.feeling} feeling that are #{@mood.category.name}", limit: 5)
    puts results
    results.map do |playlist|
      {
        content_type: "spotify", # Align with enum
        title: playlist.name,
        url: playlist.external_urls["spotify"],
        embed_url: "https://open.spotify.com/embed/playlist/#{playlist.id}"
      }
    end
  end
end
