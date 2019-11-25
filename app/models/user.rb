class User < ApplicationRecord
  has_one :employee
  belongs_to :organization

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  def to_s
    name
  end

  def admin?
    is_admin
  end

end
