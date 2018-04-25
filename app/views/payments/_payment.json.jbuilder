json.extract! payment, :id, :starts_at, :ends_at, :user_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
