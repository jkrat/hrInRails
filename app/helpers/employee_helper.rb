module EmployeeHelper

  def employees_sorted_by_last_name
    @employees.sort_by(&:last_name)
  end
end