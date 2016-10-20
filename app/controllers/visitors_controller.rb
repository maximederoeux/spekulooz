class VisitorsController < ApplicationController
  def index
  	@countries = Account.countries
  	@new_item = Item.new

  	@new_item_category = ItemCategory.new

  	if @sub_accounts.any?
  		@specials_categories = @sub_account.menus.is_specials.first.categories.all
  		@main_categories = @sub_account.menus.is_main.first.categories.all
  	end

  	@new_reservation = Reservation.new


  end
end
