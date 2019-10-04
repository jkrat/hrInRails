require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test 'validates attributes correctly' do
    transaction = Transaction.new
    assert transaction.invalid?
    assert transaction.errors[:date].any?
    assert transaction.errors[:transaction_type].any?
    assert_not transaction.save
  end

  test 'creates new transaction' do
    transaction1 = create(:transaction)
    puts transaction1.inspect
  end
end
