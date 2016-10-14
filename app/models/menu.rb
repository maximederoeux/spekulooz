class Menu < ApplicationRecord
	belongs_to :account

	has_many :menu_categories
	has_many :categories, through: :menu_categories

	scope :is_main, lambda {where(:status => "main")}
	scope :is_specials, lambda {where(:status => "specials")}
	scope :is_season, lambda {where(:status => "season")}
	scope :is_tasting, lambda {where(:status => "tasting")}

	after_create :generate_menu_categories

	STATUSES = ["main", "specials", "season", "tasting"]

	def self.statuses
    STATUSES.map do |status|
      [I18n.t("statuses.#{status}"), status]
    end
	end

	def generate_menu_categories
		category_1 = Category.create(:account_id => account_id, :name => "Entrées", :food => true)
		MenuCategory.create(:menu_id => id, :category_id => category_1.id)
		category_2 = Category.create(:account_id => account_id, :name => "Plats", :food => true)
		MenuCategory.create(:menu_id => id, :category_id => category_2.id)
		category_3 = Category.create(:account_id => account_id, :name => "Desserts", :food => true)
		MenuCategory.create(:menu_id => id, :category_id => category_3.id)			
	end

end
