class RemoveDeviseFromEmployee < ActiveRecord::Migration[6.0]
  def change
    remove_column :employees, :encrypted_password
    remove_column :employees, :reset_password_token
    remove_column :employees, :reset_password_sent_at
    remove_column :employees, :remember_created_at
    remove_column :employees, :sign_in_count
    remove_column :employees, :current_sign_in_at
    remove_column :employees, :last_sign_in_at
    remove_column :employees, :current_sign_in_ip
    remove_column :employees, :last_sign_in_ip

  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
