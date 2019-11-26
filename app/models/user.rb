class User < ApplicationRecord
  rolify
  has_one :employee
  belongs_to :organization, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  before_create :email_to_lowercase, :assign_employee
  after_create :assign_role

  def to_s
    email
  end

  private

  def email_to_lowercase
    email.strip.downcase
  end

  def assign_employee
    @employee = Employee.find_by_email(email)
    if @employee
      self.employee = @employee
      add.role :View_Access, @employee
    end
  end

  def assign_role
    @permission_level = "Employee"
    if employee
      @permission_level = employee.permission_level
    end

    # todo: scope roles to organization.  Leave other resource scoping to Pundit?
    case @permission_level
    when "Manager"
      add_role(:Manager)
    when "Admin"
      add_role(:Admin)
    when "Super"
      add_role(:Super)
    else
      add_role(:Employee)
    end
  end

end
