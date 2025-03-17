class AddMoodToContent < ActiveRecord::Migration[7.1]
  def change
    add_reference :contents, :mood, null: true, foreign_key: true
  end
end
