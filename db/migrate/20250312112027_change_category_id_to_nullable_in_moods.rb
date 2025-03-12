class ChangeCategoryIdToNullableInMoods < ActiveRecord::Migration[7.1]
  def change
    change_column_null :moods, :category_id, true
  end
end
