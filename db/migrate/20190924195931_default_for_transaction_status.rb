class DefaultForTransactionStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:transactions, :status, 0)
  end
end
