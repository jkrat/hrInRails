class TransactionPresenter < ApplicationPresenter

  def employee_full_name
    "#{@model.employee.first_name} #{@model.employee.last_name}"
  end

  def row_status_color
    @model.status == 'Void' ? @model.status : @model.transaction_type
  end

  def short_description
    @view.truncate(@model.description, length: 28)
  end

end