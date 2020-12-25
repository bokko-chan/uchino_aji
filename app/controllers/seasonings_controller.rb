class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
    # @user = current_user.id
    # @seasoning.user_seasonings.build
  end

  def create
    # binding.pry
    @seasoning = Seasoning.create(seasoning_params)
    # @seasoning = current_user.seasonings.build(seasoning_params)
    if @seasoning.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  
  def seasoning_params
    params.require(:seasoning).permit(:name, :user_created_at, :created_at, :updated_at, seasoning_ids: [], user_ids: [], user_seasonings_ids: [], user_seasonings_attributes:[:id,:seasoning_id, :user_id]).merge(user_id: current_user.id)
  end

end
