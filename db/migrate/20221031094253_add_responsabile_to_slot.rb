class AddResponsabileToSlot < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :calendario_contact_note_id, :integer
    add_column :slots, :calendario_profile_id, :integer
  end
end
