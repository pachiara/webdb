class AddIndexToInstances < ActiveRecord::Migration[5.1]
  def change
    add_index :instances, [:server_id, :id]
  end
end
