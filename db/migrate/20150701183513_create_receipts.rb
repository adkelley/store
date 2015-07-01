class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :transaction_number
      t.string :payment_method
      t.decimal :amount
      t.decimal :tip
      t.decimal :total

      t.timestamps null: false
    end
  end
end
