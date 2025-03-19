class SpotifyService
  def initialize(mood)
    @mood = mood
  end

    def fetch_playlists
      query = "songs for a #{@mood.feeling} feeling that are #{@mood.category.name}"
      results = RSpotify::Playlist.search(query, limit: 10)
      results.map do |playlist|
        {
          content_type: "spotify",
          title: playlist.name,
          url: playlist.external_urls["spotify"],
          embed_url: "https://open.spotify.com/embed/playlist/#{playlist.id}"
        }
      end
    end
end
