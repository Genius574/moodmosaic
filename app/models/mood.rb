class Mood < ApplicationRecord
  has_many :mood_logs, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  enum feeling: %i[happy meh sad]

  def mood_icon
    case feeling
    when 'happy'
      '<i class="fa-regular fa-face-smile-beam"></i>'
    when 'meh'
      '<i class="fa-regular fa-face-meh"></i>'
    when 'sad'
      '<i class="fa-regular fa-face-sad-tear"></i>'
    else
      ''
    end
  end
end
