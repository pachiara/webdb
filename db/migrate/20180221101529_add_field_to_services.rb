class AddFieldToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :card, :string
    add_column :services, :department, :string
    add_column :services, :area, :string
    add_column :services, :referent, :string
    add_column :services, :state, :string
  end
end
