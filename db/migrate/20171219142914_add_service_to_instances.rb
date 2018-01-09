class AddServiceToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instances, :service_id, :integer
  end
end
