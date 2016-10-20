json.extract! reservation, :id, :name, :account_id, :requested_time, :pax, :email, :mobile, :comment, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)