class AddNotetypeToNoteslot < ActiveRecord::Migration[7.0]
  def change
    add_column :noteslots, :note_type, :integer
  end
end
