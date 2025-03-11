class Mood < ApplicationRecord
  has_many :mood_logs, dependent: :destroy
  belongs_to :user
  belongs_to :category

  enum feeling: %i[happy meh sad]
end
