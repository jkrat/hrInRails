FactoryBot.define do

  factory :transaction do
    employee
    created_by { 'Admin' }
    date { Date.today }
    transaction_type { Transaction.transaction_types[:Scheduled] }
    delta { 0 }

    factory :initial_transaction do
      transaction_type { Transaction.transaction_types[:Adjustment] }
      delta { 4 }
    end

    factory :transaction_negative_5 do
      transaction_type { Transaction.transaction_types[:Adjustment] }
      delta { -5 }
    end
  end

  factory :employee do
    first_name { 'Joe' }
    last_name { 'Montana' }
    email { 'J_Money@hotmail.com' }
    start_date { 10.days.ago }
    location { 'Northwest Hwy' }
    department { Employee.departments['Sales'] }
    region { 'Dallas - Ft. Worth' }
    balance { 4 }

    factory :employee_with_transactions do
      last_name { ' Dirt '}
      transient do
        transactions_count { 5 }
      end

      after(:create) do |employee, evaluator|
        create_list(:transaction, evaluator.transactions_count, employee: employee)
      end
    end
  end



end