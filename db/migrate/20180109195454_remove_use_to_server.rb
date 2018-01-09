class RemoveUseToServer < ActiveRecord::Migration[5.1]
  def change
    remove_column :servers, :use, :string
  end
end
