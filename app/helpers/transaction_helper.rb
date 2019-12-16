module TransactionHelper

  def transactions_sorted_by_created_at
    @transactions.sort_by(&:created_at).reverse
  end
end