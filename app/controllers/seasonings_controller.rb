class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
  end

  def create
    @seasoning = Seasoning.create(seasoning_params)
    if @seasoning.save
      binding.pry
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  
  def seasoning_params
    params.require(:seasoning).permit(:name, :user_created_at, :created_at, :updated_at).merge(user_id: current_user.id)
  end

end
