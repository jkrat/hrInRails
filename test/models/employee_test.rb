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

    employee1 = build(:employee)
    assert employee1.valid?
  end
  
  test 'adds transactions' do
    employee = create(:employee_with_initial_transaction)
    employee.calculate_balance
    assert_equal employee.transactions.length, 1

    employee1 = create(:employee_with_transactions)
    employee1.add_transaction attributes_for(:initial_transaction)
    assert_equal 6, employee1.transactions.length
  end

  test 'calculates balance' do
    employee = create(:employee_with_initial_transaction)
    employee.calculate_balance
    assert_equal employee.balance, 10

    employee = create(:employee_with_transactions)
    employee.add_transaction attributes_for(:initial_transaction)
    assert_equal 5, employee.balance
  end

end
