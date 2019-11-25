class ChangeDefaultToPermissionLevel < ActiveRecord::Migration[6.0]
  def self.up
    change_column_default :employees, :permission_level, 0
  end
  def self.down
    change_column_default :employees, :permission_level, nil
  end
end
