class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :calendar, null: false, foreign_key: true
      t.boolean :public
      t.integer :visibility
      t.datetime :data_start
      t.datetime :data_end

      t.timestamps
    end
  end
end
