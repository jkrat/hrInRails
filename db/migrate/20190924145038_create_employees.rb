class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :email, null: false
      t.integer :balance, default: 0
      t.date    :start_date, null: false
      t.integer :location, null: false
      t.integer :department, null: false
      t.string  :region, null: false
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
