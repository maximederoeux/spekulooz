class Category < ApplicationRecord
	has_many :item_categories
	has_many :items, through: :item_categories
	has_many :menu_categories
	has_many :menus, through: :menu_categories

	belongs_to :account
end
