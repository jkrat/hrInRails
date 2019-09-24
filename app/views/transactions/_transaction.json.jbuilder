json.extract! transaction, :id, :created_by, :date, :type, :description, :coin_balance, :delta, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
