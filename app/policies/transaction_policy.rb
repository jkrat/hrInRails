class TransactionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_role? :Admin
        scope.all.joins(:employee).merge(Employee.in_organization(user.organization_id))
      else
        @managed_employees = user.roles.select{ |role| role[:name] == 'Manager' }.map{ |role| role.resource_id }
        scope.where(employee_id: @managed_employees)
      end
    end

    def create?
      user.allowed?('applicant:invite')
    end

    def show?
      user.allowed?('applicant:read')
    end
  end
end