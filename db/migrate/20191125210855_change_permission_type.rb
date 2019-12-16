class ChangePermissionType < ActiveRecord::Migration[6.0]
  def change
    change_column :employees, :permission, :integer, null: false, default: 0
  end
end
