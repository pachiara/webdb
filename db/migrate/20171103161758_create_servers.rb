class CreateServers < ActiveRecord::Migration[5.1]
  def change
    create_table :servers do |t|
      t.string :ip,       :limit => 15
      t.string :name,     :limit => 50
      t.string :use,      :limit => 20
      t.text :description
      t.text :note
      t.string :domain,   :limit => 10
      t.boolean :manage

      t.timestamps
    end
  end
end
