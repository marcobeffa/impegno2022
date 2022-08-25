class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :body
      t.integer :note_type
      t.decimal :euro_pagati, precision: 8, scale: 2
      t.decimal :euro_ricevuti, precision: 8, scale: 2
      t.datetime :data_start
      t.datetime :data_end
      t.decimal :lat, precision: 10, scale: 6
      t.decimal :long, precision: 10, scale: 6
      t.text :google_maps_url
      t.integer :stato_attention
      t.integer :visibility
      t.boolean :pubblica

      t.timestamps
    end
  end
end
