class MoodLog < ActiveRecord::Migration[7.1]
  def change
    create_table :mood_logs do |t|
      t.references :mood, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
