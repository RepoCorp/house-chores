json.extract! scheduled_chore, :id, :chore_id, :user_id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :created_at, :updated_at
json.url scheduled_chore_url(scheduled_chore, format: :json)
