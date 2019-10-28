class TimeCard < ApplicationRecord
  belongs_to :employee
  has_many :time_clock_events

  validates :pay_period, presence: true
  
  before_validation :set_pay_period, on: :create

  private
    def set_pay_period
      self.pay_period = get_pay_period_from_date(Date.today)

    end

  public 
    def get_pay_period_from_date(date)
      base_date = Date.new(2018,12,31)
      time_span = date - base_date
      pay_period = time_span.to_i / 7

      return pay_period
    end



end
