json.extract! reminder, :id, :user_id, :content_id, :status, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
