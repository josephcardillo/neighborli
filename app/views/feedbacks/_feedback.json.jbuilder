json.extract! feedback, :id, :user_id, :rating, :transaction_id, :comment, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
