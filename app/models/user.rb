class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # validates :password, presence: true
  has_many :moods, dependent: :destroy
  has_many :mood_logs, dependent: :destroy
  has_many :questions
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  def current_mood
    moods.order(updated_at: :asc).last
  end

end
