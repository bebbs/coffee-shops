class SearchController < ApplicationController
  def index
    if params[:postcode]
      flash[:no_results] = 'There are no results, please search again'
    end
  end
end