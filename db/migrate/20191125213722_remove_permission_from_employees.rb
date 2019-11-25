class RemovePermissionFromEmployees < ActiveRecord::Migration[6.0]
  def change

    remove_column :employees, :permission, :integer
  end
end
