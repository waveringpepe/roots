json.extract! crm, :id, :private_status, :public_status, :credits_balance, :comment, :subscription_renewal, :created_at, :updated_at
json.url crm_url(crm, format: :json)
