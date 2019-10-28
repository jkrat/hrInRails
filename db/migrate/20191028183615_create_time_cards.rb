class CreateTimeCards < ActiveRecord::Migration[6.0]
  def change
    create_table :time_cards do |t|
        t.references :employee, foreign_key: true
        t.integer :pay_period, null: false
      t.timestamps
    end
  end
end
