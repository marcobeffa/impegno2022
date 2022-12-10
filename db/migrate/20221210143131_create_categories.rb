class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.text :image_icona_url
      t.text :image_card_url
      t.references :calendar, null: false, foreign_key: true
      t.text :indirizzo
      t.text :luogo
      t.string :color

      t.timestamps
    end
  end
end
