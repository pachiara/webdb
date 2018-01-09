class RemoveDomainToServer < ActiveRecord::Migration[5.1]
  def change
    remove_column :servers, :domain, :string
  end
end
