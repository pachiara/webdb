class AddIndexToServices < ActiveRecord::Migration[5.1]
  def change
    add_index :services, :code,  unique: true
  end
end
