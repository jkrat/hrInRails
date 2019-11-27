class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :remove_roles, :assign_employee, :set_role

  private

  def remove_roles
    if user_signed_in?
      @user = current_user
      @user.roles.map { |role| @user.remove_role role.name }
    end
  end

  def assign_employee
    if user_signed_in?
      @user = current_user
      @employee = Employee.find_by_email @user.email
      # @user.employee = @employee
      @user.add_role :View_Access, @employee if @employee
    end
  end

  def set_role
    if user_signed_in?
      @user = current_user
      @organization = @user.organization
      @employee = @user.employee
      @permission_level = @employee ? @employee.permission_level : 'Employee'

      permission_case @permission_level
    end
  end

  def permission_case(level)
    case level
      when 'Manager'
        @user.add_role(:Manager, @organization)
      when 'Admin'
        @user.add_role(:Admin, @organization)
      when 'Super'
        @user.add_role(:Super)
      else
        @user.add_role(:Employee, @organization)
    end
  end
end