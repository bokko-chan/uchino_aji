class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

end
