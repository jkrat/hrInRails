class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :authenticate_user!, :remove_roles, :assign_employee, :set_role

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
      # @user.add_role :View_Access, @employee if @employee
    end
  end

  def set_role
    if user_signed_in?
      @user = current_user
      @employee = @user.employee
      @permission_level = @employee ? @employee.permission_level : 'Employee'

      permission_case @permission_level
    end
  end

  def permission_case(level)
    case level
      when 'Admin'
        @user.add_role(:Admin)
      when 'Super'
        @user.add_role(:Super)
      else
        @user.add_role(:Employee)
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end