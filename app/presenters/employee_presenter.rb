class EmployeePresenter < ApplicationPresenter
  include PresenterConcern

  def full_name
    @view.full_name(@model)
  end

  def trans_count
    @model.transactions.size
  end

  def transactions
    @model.transactions.by_date
  end

end