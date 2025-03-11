class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.integer :content_type
      t.string :title
      t.string :url
      t.references :mood, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
