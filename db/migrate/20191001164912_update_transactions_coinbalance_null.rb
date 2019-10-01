class UpdateTransactionsCoinbalanceNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:transactions, :coin_balance, true)
  end
end
