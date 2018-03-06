class CreateOperatingSystems < ActiveRecord::Migration[5.1]
  def change
    create_table :operating_systems do |t|
      t.string :code
      t.string :description

      t.timestamps
    end
  end
end
