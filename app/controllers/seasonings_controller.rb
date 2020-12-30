class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
    # @user_seasoning = @seasoning.user_seasonings.build
    # @user = current_user
    # @seasoning = Seasoning.find(params[:seasoning_id])
    # @user_seasoning = UserSeasoning.new
  end

  def create
    # binding.pry
    @seasoning = Seasoning.new(seasoning_params)
    # @seasoning.user_id = current_user.id
    # @seasoning = Seasoning.find(params[:seasoning_id])
    # @user_seasoning = UserSeasoning.new(seasoning_params)
    # @user_seasoning = UserSeasoning.includes(:seasonings).where(user_id: current_user.id)
    # @user_seasoning = Seasoning.includes(:user).where(user_id: current_user.id)
    # @user_seasoning = Seasoning.includes(:user_seasonings).where(user_id: current_user.id)
    # @seasoning = Seasoning.includes(user_id: current_user.id).create(seasoning_params)
    # @seasoning = @user_seasoning.build(seasoning_params)
    # @user = current_user
    # @user_seasoning = @user.seasonings.build(seasoning_params)
    # @user = User.find(params[:user_id])
    # @seasoning = @user.seasonings.create(seasoning_params)
    # @seasoning = @user_seasoning.create(seasoning_params)
    if @seasoning.save
      # binding.pry
      redirect_to action: :index
    else
      render :new
    end
  end

  private
  
  def seasoning_params
    params.require(:seasoning).permit(:name, :user_created_at, :created_at, :updated_at, :user_id, user_ids: [], seasoning_ids: [], seasonings: {}).merge(user_id: current_user.id)
  end

end
