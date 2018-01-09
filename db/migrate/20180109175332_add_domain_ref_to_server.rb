class AddDomainRefToServer < ActiveRecord::Migration[5.1]
  def change
    add_reference :servers, :domain, foreign_key: true
  end
end
