class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: true, foreign_key: true
      t.string :title
      t.text :description
      t.text :avatar_url
      t.string :name
      t.string :surname
      t.string :username
      t.string :email
      t.string :phone
      t.string :smartphone
      t.decimal :prezzo_orario
      t.integer :active_profile_id
      t.integer :team_id
      t.integer :referente_profile_id

      t.timestamps
    end
  end
end
