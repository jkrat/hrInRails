class AddPermissionLevelToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :permission_level, :integer
  end
end
