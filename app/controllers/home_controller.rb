class HomeController < ApplicationController
  before_action :authenticate_user!
  layout false

  def index
    if not current_user or not current_user.employee
      render :index
    else
      case current_user.employee.permission_level
      when "Employee"
        render :index
      when 'Admin'
        redirect_to employees_path
      when 'Super'
        redirect_to admin_root_path
      end
    end
  end
end
