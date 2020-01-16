FactoryBot.define do

  factory :transaction do
    employee
    created_by { 'Admin' }
    date { Date.today }
    transaction_type { Transaction.transaction_types[:Scheduled] }
    delta { -1 }

    factory :initial_transaction do
      transaction_type { Transaction.transaction_types[:Adjustment] }
      delta { 10 }
    end

    factory :transaction_negative_5 do
      transaction_type { Transaction.transaction_types[:Adjustment] }
      delta { -5 }
    end
  end

  factory :employee do
    first_name { 'Joe' }
    last_name { 'Montana' }
    email { "J_money@gmail.com" }
    start_date { 10.days.ago }
    location { 'Northwest Hwy' }
    department { Employee.departments['Sales'] }
    region { 'Dallas - Ft. Worth' }
    status { Employee.statuses['Active'] }
    permission_level { Employee.permission_levels['Employee'] }
    association :organization
  end

  factory :employee_with_initial_transaction, parent: :employee do
    email { "#{Time.now.to_s}@gmail.com" }
    transient do
      transactions_count { 1 }
    end

    after(:create) do |employee, evaluator|
      create_list(:initial_transaction, evaluator.transactions_count, employee: employee)
    end
  end

  factory :employee_with_transactions, parent: :employee do
    email { "#{Time.now.to_s}2@gmail.com" }
    transient do
      transactions_count { 5 }
    end

    after(:create) do |employee, evaluator|
      create_list(:transaction, evaluator.transactions_count, employee: employee)
    end
  end

end