class AddSublocationToSlot < ActiveRecord::Migration[7.0]
  def change
    add_column :slots, :sublocation_id, :integer
    add_column :slots, :luogo_n_id, :integer
    add_column :slots, :event_id, :integer
    add_column :slots, :responsabile_p_id, :integer
    add_column :slots, :category_id, :integer
  end
end
