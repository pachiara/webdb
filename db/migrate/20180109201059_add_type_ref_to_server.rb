class AddTypeRefToServer < ActiveRecord::Migration[5.1]
  def change
    add_reference :servers, :type, foreign_key: true
  end
end
