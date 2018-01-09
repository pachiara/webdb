class AddServiceRefToInstance < ActiveRecord::Migration[5.1]
  def change
    remove_column :instances, :service_id, :integer
    add_reference :instances, :service, foreign_key: true
  end
end
