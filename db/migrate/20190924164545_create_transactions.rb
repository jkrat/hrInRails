class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :employee, foreign_key: true
      t.string :created_by, null: false
      t.date :date, null: false
      t.integer :type, null: false
      t.string :description
      t.integer :coin_balance, null: false
      t.integer :delta, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
