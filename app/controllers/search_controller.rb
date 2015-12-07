class SearchController < ActionController::Base
  def search
    @drink_results = Search.drink_search(params[:search])
    @ingredient_results = Search.ingredient_search(params[:search])
  end
end
