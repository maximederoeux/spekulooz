class VisitorsController < ApplicationController
  def index
  	@countries = Account.countries
  	@new_item = Item.new
  	@categories = @sub_account.categories.all
  	@new_item_category = ItemCategory.new

  end
end
