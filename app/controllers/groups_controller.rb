class GroupsController < ApplicationController
  before_action :authenticate_user!
  layout 'main_layout'

  before_action :set_manager, except: :index
  before_action :set_employee, only: :remove_employee

  # GET /index
  def index
    @employees = policy_scope(Employee)
    @managers = @employees.manager
  end

  # GET /groups/details/1
  def details
    @manager_roles = @manager.roles.select{ |role| role[:name] == 'Manager' and role[:resource_type] == 'Employee' }
    @managed_employees = @manager_roles.map{ |role| Employee.find(role.resource_id) }
    @group_details = { manager: @manager, managed_employees: @managed_employees }
  end

  # POST /groups/1/add_employee?employee_id=155
  def add_employee
    @manager.add_role :Manager, @employee
  end

  # POST groups/addAllAtLocation/1?location=Arlingtion
  def add_all_at_location
  end

  # GET groups/1/remove_employee/155
  def remove_employee
    @manager.remove_role :Manager, @employee
    redirect_to group_url(@manager.id)
  end

  # GET groups/RemoveAllEmployees/1
  def remove_all_employees
  end



  private

  def set_manager
    @manager = User.find(params[:id])
  end

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def group_params
    params.permit(:employeeId, :location)
  end
end