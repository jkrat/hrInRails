class Transaction < ApplicationRecord
  belongs_to :employee
  enum transaction_type: {
    Scheduled: 0,
    Unscheduled: 1,
    Unpaid: 2,
    Credit: 3,
    Adjustment: 4
  }
  enum status: {
    Approved: 0,
    Requested: 1,
    Void: 2
  }

  validates :date, presence: true
  validates :transaction_type, inclusion: transaction_types.keys

  def delta=(adjustment_amount)
    scheduled_delta = -1
    unscheduled_delta = -2
    credit_delta = 1
    if status == Transaction.statuses['Void']
      self[:delta] = 0
    else
      self[:delta] = case transaction_type
                      when 'Scheduled'
                      -1
                        # scheduled_delta
                      when 'Unscheduled'
                        unscheduled_delta
                      when 'Unpaid'
                        0
                      when 'Credit'
                        credit_delta
                      when 'Adjustment'
                        adjustment_amount
                      else
                        0
       end
    end
  end

  def void_transaction
    self[:status] = 2
    self[:delta] = 0
    save
  end

end
