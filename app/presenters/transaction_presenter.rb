class TransactionPresenter < ApplicationPresenter

  def employee_full_name
    @view.full_name(@model.employee)
  end

  def row_status_color
    @model.status == 'Void' ? @model.status : @model.transaction_type
  end

  def short_description
    @view.truncate(@model.description, length: 28)
  end

  def delta
    @model.delta.positive? ? "+ #{@model.delta}" : @model.delta
  end

end