module EmployeeHelper

  def form_email_class(action_name)
    @class = if action_name == 'new'
               'col-md-12'
             else
               'col-md-8'
             end
  end

  def form_start_date_class(action_name)
    @class = if action_name == 'new'
               'single'
             else
               'none'
             end
  end
end