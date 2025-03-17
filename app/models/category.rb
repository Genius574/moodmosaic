class Category < ApplicationRecord
  NAMES = %w[Uplifting Emotional Calming Serious]

  def category_icon
    case name
    when 'Uplifting'
      '<i class="fa-regular fa-sun"></i>'
    when 'Emotional'
      '<i class="fa-regular fa-heart"></i>'
    when 'Calming'
      '<i class="fa-solid fa-wind"></i>'
    when 'Serious'
      '<i class="fa-solid fa-scale-balanced"></i>'
    else
      ''
    end
  end
end
