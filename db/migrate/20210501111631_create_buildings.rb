class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.integer :old
      t.text :comment

      t.timestamps
    end
  end
end
