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
  
  # def seasoning_params
  #   params.require(:seasoning).permit(:salt_sugar_id,:soy_sauce_id, :liquor_id, :miso_id, :dashi_id, :oil_id, :vinegar_id, :sauce_id, :western_id, :chinese_id, :spice_herb_id, :roux_id, :dressing_id, :other_id).merge(user_id: current_user.id)
  # end

end
