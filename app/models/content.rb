class Content < ApplicationRecord
  belongs_to :category
  enum content_type: %i[spotify youtube blogs]
end
