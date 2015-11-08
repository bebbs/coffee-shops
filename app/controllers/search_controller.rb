class SearchController < ApplicationController
  def index
    @coffee_shops = []
    @postcode = params[:postcode]
    if @postcode
      @coffee_shops = FindCoffeeShops.call(params[:postcode])
    end
  end
end