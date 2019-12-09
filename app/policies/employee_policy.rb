class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_role? :Admin or user.has_role? :Super
        scope.all
      else
        @managed_employees = user.roles.select{ |role| role[:name] == "Manager" }.map{ |role| role.resource_id }
        @employees = @managed_employees.map{ |employee| Employee.find(employee) }
        scope.all
        # scope.where(@managed_employees.include? 13)
      end
    end
  end

  def show?
    @user.has_role? :Super or @record == @user.employee
  end
end