class VisitorsController < ApplicationController
  def index
  	@countries = Account.countries
  	@new_item = Item.new

  	@new_item_category = ItemCategory.new

  	if @sub_accounts.any?
  		@categories = @sub_account.categories.all
  	end

  end
end
