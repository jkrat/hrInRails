class User < ApplicationRecord
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

end
