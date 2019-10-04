require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  test 'validates attributes correctly' do
    employee = Employee.new
    assert employee.invalid?
    assert employee.errors[:first_name].any?
    assert employee.errors[:last_name].any?
    assert employee.errors[:email].any?
    assert employee.errors[:start_date].any?
    assert employee.errors[:location].any?
    assert employee.errors[:region].any?
    assert employee.errors[:department].any?
    assert_not employee.save
  end
  
  test 'adds transactions' do
    employee1 = build(:employee)
    employee2 = create(:employee_with_transactions)
    assert employee1.valid?
    assert_equal employee2.transactions.length, 5
  end
end
