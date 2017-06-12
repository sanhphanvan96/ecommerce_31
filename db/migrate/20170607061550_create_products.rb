class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price, default: 0
      t.string :image
      t.text :description
      t.integer :subcategory_id
      t.integer :quantity
      t.integer :views
      t.references :rating, foreign_key: true

      t.timestamps
    end
  end
end
