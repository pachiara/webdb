class AddFieldToOperatingSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :operating_systems, :unix, :boolean
    add_column :operating_systems, :win, :boolean
  end
end
