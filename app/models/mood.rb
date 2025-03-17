class Mood < ApplicationRecord
  has_many :mood_logs, dependent: :destroy
  belongs_to :user
  belongs_to :category, optional: true
  enum feeling: %i[happy meh sad]

  def mood_icon
    case feeling
    when 'happy'
      '<i class="fa-regular fa-face-smile-beam mood-icon--happy"></i>'
    when 'meh'
      '<i class="fa-regular fa-face-meh mood-icon--meh"></i>'
    when 'sad'
      '<i class="fa-regular fa-face-sad-tear mood-icon--sad"></i>'
    else
      ''
    end
  end
end
