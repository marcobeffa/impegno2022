class CreateCalendars < ActiveRecord::Migration[7.0]
  def change
    create_table :calendars do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :body
      t.text :image_square_url
      t.text :image_logo_url
      t.integer :calendar_type
      t.integer :luogo_note_id
      t.integer :attivita_note_id
      t.integer :gruppo_note_id
      t.integer :responsabile_profile_id
      t.boolean :public
      t.integer :visibility
      t.decimal :uscite, precision: 8, scale: 2
      t.decimal :entrate, precision: 8, scale: 2
      t.datetime :data_start
      t.datetime :data_end
      t.decimal :zoom_index, precision: 8, scale: 2
      t.string :hex_color

      t.timestamps
    end
  end
end
