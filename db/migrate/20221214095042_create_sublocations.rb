class CreateSublocations < ActiveRecord::Migration[7.0]
  def change
    create_table :sublocations do |t|
      t.references :note, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.text :img_quadrata_url
      t.text :img_ret_orizzontale
      t.text :img_ret_verticale
      t.integer :num_posti_max
      t.integer :num_location
      t.boolean :public
      t.integer :visibility

      t.timestamps
    end
  end
end
