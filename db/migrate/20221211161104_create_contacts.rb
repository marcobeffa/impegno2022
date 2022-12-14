class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :user, null: true, foreign_key: true
      t.integer :referencte_c_id
      t.references :profile, null: true, foreign_key: true
      t.integer :contatto_p_id
      t.string :nome
      t.string :cognome
      t.string :indirizzo
      t.string :codice_fiscale
      t.string :email
      t.string :telefono
      t.string :via
      t.string :cap
      t.string :paese_città
      t.string :provincia
      t.text :address_complete
      t.decimal :latitude,  precision: 10, scale: 6 
      t.decimal :longitude,  precision: 10, scale: 6 

      t.timestamps
    end
  end
end
