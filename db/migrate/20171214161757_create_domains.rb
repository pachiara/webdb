class CreateDomains < ActiveRecord::Migration[5.1]
  def change
    create_table :domains do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
