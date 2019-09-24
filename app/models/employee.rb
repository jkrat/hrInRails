class Employee < ApplicationRecord
  has_many :transactions, dependent: :destroy
  enum department: {
      "Office" => 0,
      "Sales" => 1,
      "Garage" => 2,
      "Executive" => 3
  }
  enum permission_level: {
      "Employee" => 0,
      "Manager" => 1,
      "Admin" => 2,
      "Super" => 3
  }
  enum status: {
      "Active" => 0,
      "Inactive" => 1
  }

  validates :first_name, :last_name, :email, :start_date, :location, :department, :region, :status, presence: true
  validates :department, inclusion: departments.keys
  validates :status, inclusion: statuses.keys
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  # def email(new_email)
  #   self[:email] = new_email.strip.downcase
  # end

end
