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

  scope :by_creation, -> { order(:created_at) }
  scope :by_date, -> { order(date: :desc).order(created_at: :desc) }

  def delta=(adjustment_amount)
    scheduled_delta = -1
    unscheduled_delta = -2
    credit_delta = 1
    self[:delta] = case transaction_type
                   when 'Scheduled'
                     scheduled_delta
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

  def void_transaction
    original_delta = delta
    self[:status] = 2
    self[:delta] = 0
    save
    original_delta
  end

  def un_void(original_delta)
    self[:status] = 0
    self[:delta] = original_delta
    save
  end

  def self.create_initial_transaction(delta, creator)
    transaction_params = {
      created_by: creator,
      created_at: Date.today,
      date: Date.today,
      transaction_type: Transaction.transaction_types['Adjustment'],
      description: 'Initial Chacoin Balance',
      status: Transaction.statuses['Approved'],
      delta: delta
    }
  end
end
