class CreatePrenotations < ActiveRecord::Migration[7.0]
  def change
    create_table :prenotations do |t|
      t.references :contact, null: true, foreign_key: true
      t.references :slot, null: true, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.string :email
      t.string :telefono
      t.integer :stato_prenotazione
      t.datetime :confermata
      t.references :profile, null: true, foreign_key: true
      t.integer :pagamento_tipo
      t.datetime :data_pagamento
      t.integer :fattura_n
      t.integer :fattura_anno
      t.decimal :price_value
      t.string :name
      t.string :description
      t.integer :tipo_prenotazione
      t.boolean :public
      t.integer :visibility

      t.timestamps
    end
  end
end
