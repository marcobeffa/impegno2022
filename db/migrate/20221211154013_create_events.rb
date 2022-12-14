class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.text :image_icona_url
      t.text :image_card_url
      t.integer :n_partecipanti
      t.integer :n_conduttori
      t.integer :durata_minuti
      t.text :indirizzo
      t.text :luogo
      t.string :paese
      t.decimal :prezzo_pieno
      t.decimal :prezzo_bambini
      t.references :calendar, null: true, foreign_key: true
      t.references :category, null: true, foreign_key: true
      t.datetime :data_conferma
      t.boolean :public
      t.integer :visibility

      t.timestamps
    end
  end
end
