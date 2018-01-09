class AddUseRefToServer < ActiveRecord::Migration[5.1]
  def change
    add_reference :servers, :use, foreign_key: true
  end
end
