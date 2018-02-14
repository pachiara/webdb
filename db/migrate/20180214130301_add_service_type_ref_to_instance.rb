class AddServiceTypeRefToInstance < ActiveRecord::Migration[5.1]
  def change
    add_reference :instances, :service_type, foreign_key: true
  end
end
