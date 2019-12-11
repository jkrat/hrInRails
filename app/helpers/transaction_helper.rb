module TransactionHelper

  def employee_full_name(transaction)
    "#{transaction.employee.first_name} #{transaction.employee.last_name}"
  end

  def transactions_sorted_by_created_at
    @transactions.sort_by(&:created_at).reverse
  end

  def date_format(date)
    date.strftime('%b %d, %Y')
  end

  def date_format_with_day_of_week(date)
    date.strftime('%a, %b %d, %Y')
  end
end