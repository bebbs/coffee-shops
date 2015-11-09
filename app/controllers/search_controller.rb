class SearchController < ApplicationController
  def index
    @coffee_shops = []
    @postcode = params[:postcode]
    if @postcode
      @coffee_shops = FindCoffeeShops.call(params[:postcode])
      @coffee_shops.sort_by! {|c| c.popularity}.reverse!
    end 

    if params[:show_map] == "true"
      render 'map'
    end
  end
end