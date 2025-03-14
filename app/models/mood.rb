class Mood < ApplicationRecord
  has_many :mood_logs, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  enum feeling: %i[happy meh sad]

  # def retrieve_playlists
  #   playlists = RSpotify::Playlist.search("#{feeling} #{category.name}")
  # end
end

