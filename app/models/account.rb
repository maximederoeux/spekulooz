class Account < ApplicationRecord
	belongs_to :users
	has_many :items
end
