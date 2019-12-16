class ChangeEmployeeStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :permission, :integer, null: false
    change_column :employees, :status, :integer, null: false
  end
end
