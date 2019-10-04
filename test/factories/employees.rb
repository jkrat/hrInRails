FactoryBot.define do

  factory :transaction do
    employee
    created_by { 'Admin' }
    date { Date.today }
    transaction_type { Transaction.transaction_types[:Scheduled] }
    delta { 0 }
  end

  factory :employee do
    first_name { 'Joe' }
    last_name { 'Montana' }
    email { 'J_Money@hotmail.com' }
    start_date { 10.days.ago }
    location { 'Northwest Hwy' }
    department { Employee.departments['Sales'] }
    region { 'Dallas - Ft. Worth' }

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