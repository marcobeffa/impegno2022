class CreateNoteslots < ActiveRecord::Migration[7.0]
  def change
    create_table :noteslots do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
  end
end
