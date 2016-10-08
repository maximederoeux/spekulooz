class Menu < ApplicationRecord
	belongs_to :account

	has_many :menu_categories
	has_many :categories, through: :menu_categories

	scope :is_main, lambda {where(:status => "main")}
	scope :is_specials, lambda {where(:status => "specials")}
	scope :is_season, lambda {where(:status => "season")}
	scope :is_tasting, lambda {where(:status => "tasting")}


	STATUSES = ["main", "specials", "season", "tasting"]

	def self.statuses
    STATUSES.map do |status|
      [I18n.t("statuses.#{status}"), status]
    end
	end

	
end
