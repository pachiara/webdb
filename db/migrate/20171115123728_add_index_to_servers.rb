class AddIndexToServers < ActiveRecord::Migration[5.1]
  def change
    add_index :servers, :ip
  end
end
