class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :image
      t.string :description
      t.integer :price
      t.string :sku
      t.integer :stock
      t.integer :cost
      t.references :subcategory, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
