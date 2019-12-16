class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_role? :Admin
        scope.where(organization_id: user.organization_id)
      else
        @managed_employees = user.roles.select{ |role| role[:name] == 'Manager' }.map{ |role| role.resource_id }
        scope.where(organization_id: user.organization_id, employee_id: @managed_employees)
      end
    end
  end
end