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

  def assign_employee
    # guard against non-employees
    @employee = Employee.find_by_email(email)
    self.employee = @employee
  end

  def assign_role
    @permission_level = employee ? employee.permission_level : 0
    case @permission_level
    when 1
      add_role(:Manager)
    when 2
      add_role(:Admin)
    when 3
      add_role(:Super)
    else
      add_role(:Employee)
    end
  end

end
