class HomeController < ApplicationController

  def index
    if user_signed_in?
      if current_user.employee
        case current_user.employee.permission_level
        when "Employee"
          redirect_to users_path
        when "Manager"
          redirect_to users_path
        when 'Admin'
          redirect_to employees_path
        when 'Super'
          redirect_to admin_root_path
        end
      end
    end
  end
end
