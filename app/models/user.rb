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

  private

  def email_to_lowercase
    email.strip.downcase
  end

  def assign_employee
    @employee = Employee.find_by_email(email)
    self.employee = @employee if @employee
  end

  def assign_organization
    @organization = Organization.find(1)
    self.organization = @organization
  end

end
