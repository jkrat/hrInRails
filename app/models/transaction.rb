class Transaction < ApplicationRecord
  belongs_to :employee
  enum transaction_type: {
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

  validates :date, presence: true
  validates :transaction_type, inclusion: transaction_types.keys

  scheduledDelta = -1
  unscheduledDelta = -2
  creditDelta = 1

  def set_delta(adjustment_amount)
    self[:delta] = 1
  end

end
