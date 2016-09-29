class Account < ApplicationRecord
	belongs_to :user
	has_many :items


  def display_slug
    ENV['BASE_URL'] + self.subdomain
  end

end
