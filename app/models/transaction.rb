class Transaction < ApplicationRecord
  belongs_to :employee
  enum type: {
      "Scheduled" => 0,
      "Unscheduled" => 1,
      "Unpaid" => 2,
      "Credit" => 3,
      "Adjustment" => 4
  }
  enum status: {
      "Approved" => 0,
      "Requested" => 1,
      "Void"=> 2
  }

  validates :created_by, :date, :type, :description, :coin_balance, :delta, :status, presence: true
  validates :type, inclusion: types.keys
  validates :status, inclusion: statuses.keys

  scheduledDelta = -1
  unscheduledDelta = -2
  creditDelta = 1

  def set_delta(adjustment_amount)
    self[:delta] = 1
  end

end
