class CreateInstances < ActiveRecord::Migration[5.1]
  def change
    create_table :instances do |t|
      t.integer :server_id
      t.string  :name,      :limit => 10
      t.string  :port,      :limit => 10
      t.text    :note
      t.boolean :check

      t.timestamps
    end
  end
end
