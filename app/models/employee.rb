class Employee < ApplicationRecord
  resourcify

  belongs_to :user, optional: true
  belongs_to :organization
  has_many :transactions, dependent: :destroy

  enum department: {
    Office: 0,
    Sales: 1,
    Garage: 2,
    Executive: 3
  }
  enum status: {
    Active: 0,
    Inactive: 1
  }
  enum permission_level: {
    Employee: 0,
    Manager: 1,
    Admin: 2,
    Super: 3
  }

  validates :first_name, :last_name, :email, :start_date, :location, :region, presence: true
  validates :department, inclusion: departments.keys
  validates :status, inclusion: statuses.keys
  validates :permission_level, inclusion: permission_levels.keys
  validates :balance, numericality: { greater_than_or_equal_to: 0 }

  scope :active, ->() { where('employees.status == ?', Employee.statuses['Active']) }
  scope :region, ->(region) { where region: region }
  scope :location, ->(location) { where location: location }
  scope :department, ->(department) { where department: department }
  scope :last_name, ->(last_name) { where('last_name like ?', "#{last_name}%")}

  before_save :email_to_lowercase, :assign_user

  def add_transaction(params)
    @transaction = transactions.build(params)
    calculate_balance
    @transaction.coin_balance = balance
  end

  def calculate_balance
    self.balance = transactions.sum(&:delta)
  end

  private

  def email_to_lowercase
    email.strip.downcase
  end

  def assign_user
    @user = User.find_by_email(email)
    self.user_id = @user.id if @user
    @user.add_role 'View_Access', self
  end

end
