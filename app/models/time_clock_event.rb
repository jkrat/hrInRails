class TimeClockEvent < ApplicationRecord
  belongs_to: time_card

  enum clock_event_type: {
    In: 0,
    Out: 1
  }
  
  validates :time, presence: true
  validates :type, inclusion: clock_event_type.keys
end
