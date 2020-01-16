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
    transaction = create(:transaction)
    assert transaction.valid?
  end

  test 'blocks transaction that makes employee balance negative' do
    employee = create(:employee_with_initial_transaction)
    employee.calculate_balance

    transaction = build(:transaction_negative_5)
    employee.transactions << transaction
    assert employee.save

    employee.transactions << transaction
    employee.calculate_balance
    assert employee.save

    employee.transactions << transaction
    employee.calculate_balance
    assert_not employee.save

    end

end
