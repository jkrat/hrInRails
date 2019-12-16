class EmployeePresenter < ApplicationPresenter

  def full_name
    @view.full_name(@model)
  end

  def sorted_transactions
    @model.transactions.sort_by(&:date).reverse
  end

  def trans_count
    @model.transactions.count
  end
end