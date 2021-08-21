# frozen_string_literal: true

class CreateTracks < ActiveRecord::Migration[6.1]
  def change
    create_table :tracks do |t|
      t.string :sport
      t.date :day
      t.integer :distance
      t.integer :moving_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
