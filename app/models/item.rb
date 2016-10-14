class Item < ApplicationRecord
	has_many :item_categories
	has_many :categories, through: :item_categories

	belongs_to :account

	has_attached_file :picture, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

end
