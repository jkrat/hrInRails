require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @employee = create(:employee)
  end

  teardown do
    Rails.cache.clear
  end
  
  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end
  
  test "should create employee" do
    assert_difference 'Employee.count' do
      post employees_url, params: { 
        employee: { 
          first_name: @employee.first_name, 
          last_name: @employee.last_name, 
          email: @employee.email, 
          start_date: @employee.start_date, 
          region: @employee.region, 
          location: @employee.location, 
          department: @employee.department,
          balance: @employee.balance
          }
        }
    end

    assert_redirected_to employee_url(Employee.last)
    assert_equal 'Employee was successfully created.', flash[:success]
    
    follow_redirect!
    assert_response :success
  end

  test "Should handle invalid creation of employee" do
    assert_no_difference 'Employee.count' do
      post employees_url, params: { 
        employee: { 
          first_name: @employee.first_name, 
          last_name: @employee.last_name, 
          email: @employee.email, 
          start_date: @employee.start_date, 
          region: @employee.region, 
          location: @employee.location, 
          balance: @employee.balance
          }
        }
    end

    assert_response :success
    assert_nil flash[:success]
  end

  
  test "should get edit" do
    get edit_employee_url(@employee.id)
    assert_response :success
  end
  
  test "should update employee" do
    patch employee_url(@employee), params: { 
      employee: {  
        email: 'CC@cc.com', 
        } 
      }

    assert_redirected_to employee_url(@employee)
    assert_equal 'CC@cc.com', Employee.last.email
  end
  
  test "should destroy employee" do
    assert_difference 'Employee.count', -1 do
      delete employee_url(@employee)
    end
  
    assert_redirected_to employees_url
  end

  test "should route correctly" do

    assert_routing '/employees', controller: 'employees', action: 'index'
    
    assert_routing '/employees/12', controller: 'employees', action: 'show', id: '12'
    
    assert_routing '/employees/new', controller: 'employees', action: 'new'
    
    assert_routing '/employees/1/edit', controller: 'employees', action: 'edit', id: '1'
    
    assert_routing({method: 'post', path: '/employees'}, {controller: 'employees', action: 'create' })
    
    assert_routing({method: 'patch', path: '/employees/21'}, {controller: 'employees', action: 'update', id: '21' })
    
    assert_routing({method: 'delete', path: '/employees/31'}, {controller: 'employees', action: 'destroy', id: '31' })

  end
end
