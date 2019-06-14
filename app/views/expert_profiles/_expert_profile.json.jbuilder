json.extract! expert_profile, :id, :status_id, :bank_account_id, :created_at, :updated_at
json.url expert_profile_url(expert_profile, format: :json)
