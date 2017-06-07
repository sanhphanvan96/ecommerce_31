class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.references :user, foreign_key: true
      t.string :category_name
      t.string :product_name
      t.string :image
      t.text :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
