class SpotifyService
  def initialize(mood)
    @mood = mood
  end

  def fetch_playlists
    results = RSpotify::Playlist.search("songs for a #{@mood.feeling} feeling that are #{@mood.category.name}", limit: 10)
    puts results
    results.map do |playlist|
      {
        title: playlist.name,
        url: playlist.external_urls["spotify"],
        embed_url: "https://open.spotify.com/embed/playlist/#{playlist.id}"
      }
    end
  end
end
