class AddColumnEmployeePermission < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :permission, :permission_level
  end
end
