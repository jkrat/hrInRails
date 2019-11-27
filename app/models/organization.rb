class Organization < ApplicationRecord
  resourcify

  has_many :users, dependent: :destroy
  has_many :employees, dependent: :destroy

  def to_s
    name
  end

  def active?
    is_active
  end
end
