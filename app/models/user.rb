class User < ApplicationRecord
  rolify
  has_one :employee
  belongs_to :organization, optional: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  before_create :email_to_lowercase, :assign_employee

  def to_s
    email
  end

  def allowed?(requested_permission)
    if admin?
      true
    elsif group.full_access?
      true
    else
      noun = requested_permission.split(':')[0]
      full_access = "#{noun}:full_access"
      group.permissions.include?(requested_permission) || group.permissions.include?(full_access)
    end
  end

  private

  def email_to_lowercase
    email.strip.downcase
  end

  def assign_employee
    @employee = Employee.find_by_email(email)
    self.employee = @employee if @employee
  end

  def assign_organization
    @organization = Organization.find(@employee.organization_id)
    self.organization = @organization
  end

end
