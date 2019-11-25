class ChangeColoumnDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :employees, :permission, nil
  end
end
