class VisitorsController < ApplicationController
  def index
  	@countries = Account.countries

  end
end
