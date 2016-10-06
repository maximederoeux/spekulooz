json.extract! category, :id, :name, :description, :food, :drink, :account_id, :created_at, :updated_at
json.url category_url(category, format: :json)