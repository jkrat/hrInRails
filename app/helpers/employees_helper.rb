module EmployeesHelper

  def full_name
    "#{@employee.first_name}_#{@employee.last_name}"
  end
end
