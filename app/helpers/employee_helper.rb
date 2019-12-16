module EmployeeHelper

  def employees_sorted_by_last_name
    @employees.sort_by(&:last_name)
  end

  def form_email_class(action_name)
    @class = if action_name == 'new'
               'col-md-12'
             else
               'col-md-8'
             end
  end
end