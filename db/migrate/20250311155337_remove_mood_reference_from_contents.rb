class RemoveMoodReferenceFromContents < ActiveRecord::Migration[7.1]
  def change
    remove_reference :contents, :mood, foreign_key: true
  end
end

