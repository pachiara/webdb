class AddFieldToCommands < ActiveRecord::Migration[5.1]
  def change
    add_column :commands, :unix, :boolean
    add_column :commands, :win, :boolean
  end
end
