class VisitorsController < ApplicationController
  def index
  	@countries = Account.countries
  	@new_item = Item.new
  	@categories = Category.all
  	@new_item_category = ItemCategory.new

  	@main_menu = @sub_account.menus.is_main.first
  end
end
