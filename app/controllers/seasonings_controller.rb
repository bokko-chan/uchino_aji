class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
  end

  def create
  end

end
