json.extract! transaction, :id, :borrower_id, :lender_id, :status, :expires_at, :starts_at, :type, :has_borrower_feedback, :has_lender_feedback, :category, :title, :body, :item_location, :loan_duration, :day_rate, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
