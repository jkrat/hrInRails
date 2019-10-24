require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = create(:employee)
  end
  
  test "should get index" do
    get employees_url
    assert_response :success
  end
  
  test "should get new" do
    get new_employee_url
    assert_response :success
  end
  
  # test "should create employee" do
  #   puts Employee.count
  #   # assert_difference 'Employee.count', 1 do
  #   post employees_url, params: { :employee => { balance: @employee.balance, email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, region: @employee.region, start_date: @employee.start_date, location: @employee.location }}
  #   # end
  #   @employee1 = create(:employee)
  #   puts Employee.count
  # end
  
  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end
  
  test "should get edit" do
    get edit_employee_url(@employee.id)
    assert_response :success
  end
  
  # test "should update employee" do
  #   patch employee_url(@employee), params: { employee: { balance: @employee.balance, email: @employee.email, first_name: @employee.first_name, last_name: @employee.last_name, region: @employee.region, start_date: @employee.start_date } }
  #   assert_redirected_to employee_url(@employee)
  # end
  
  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end
  
    assert_redirected_to employees_url
  end
end
