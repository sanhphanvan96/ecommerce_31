class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.boolean :status, default: false
      t.float :total_payment, default: 0
      t.text :infor
      t.datetime :date

      t.timestamps
    end
  end
end
