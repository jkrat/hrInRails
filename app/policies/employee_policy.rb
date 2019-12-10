class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_role? :Admin
        scope.where(organization_id: user.organization_id)
      else
        @managed_employees = user.roles.select{ |role| role[:name] == 'Manager' }.map{ |role| role.resource_id }
        scope.where(organization_id: user.organization_id, id: @managed_employees)
        # scope.all
      end
    end
  end

  def show?
    @user.has_role? :Admin or @record == @user.employee
  end
end