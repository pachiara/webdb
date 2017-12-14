class CreateCommands < ActiveRecord::Migration[5.1]
  def change
    create_table :commands do |t|
      t.string :code
      t.string :description
      t.string :query
      t.string :exec

      t.timestamps
    end
  end
end
