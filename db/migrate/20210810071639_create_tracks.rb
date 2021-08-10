class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :sport
      t.date :day
      t.integer :moving_time
      t.integer :distance
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
