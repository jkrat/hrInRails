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
  end

  test 'blocks transaction that makes employee balance negative' do
    @employee = create(:employee)
    @transaction_initial = build(:initial_transaction)
    @transaction = build(:transaction_negative_5)

    @employee.transactions << @transaction_initial
    
    p @employee.balance

    @employee.transactions << @transaction
    @employee.calculate_balance

    p @employee.balance

    assert_equal -1, @employee.balance
    end

end
