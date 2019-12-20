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

  def group_size
    return 0 unless @model.user_id
    @user = User.find(@model.user_id)
    @user.roles.select{ |role| role[:name] == 'Manager' and role[:resource_type] == 'Employee' }.size
  end

end