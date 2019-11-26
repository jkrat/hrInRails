class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      if current_user.employee
        case current_user.employee.permission_level
        when "Employee"
          render :index
        when "Manager"
          render :index
        when 'Admin'
          redirect_to employees_path
        when 'Super'
          redirect_to admin_root_path
        end
      end
    end
  end
end
