class UpdateEmployeeLocatoinToString < ActiveRecord::Migration[6.0]
  def up
    change_column :employees, :location, :string, null: false
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
f