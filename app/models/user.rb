class User < ApplicationRecord
  rolify
  before_save :assign_employee
  after_create :assign_role
  after_update :assign_role

  has_one :employee
  belongs_to :organization, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    email
  end

  def admin?
    is_admin
  end

  def assign_employee
    # guard against non-employees
    @employee = Employee.find_by_email(email)
    self.employee = @employee
  end

  def assign_role
    @permission_level = employee.permission_level
    case @permission_level
    when 0
      add_role(:employee)
    when 2
      add_role(:admin)
    when 3
      add_role(:super)
    end
  end

end
