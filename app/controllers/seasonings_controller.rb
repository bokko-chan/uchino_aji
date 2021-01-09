class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
    @user = User.find(current_user.id) 
    # @user_seasoning = @seasoning.user_seasonings.build
    # @user = current_user
    # @seasoning = Seasoning.find(params[:seasoning_id])
    # @user_seasoning = UserSeasoning.new
  end

  def create
    # binding.pry
    @user_seasonings = [] 
    if seasoning_params[:seasonings][:name].present?
      s = Seasoning.create(name: seasoning_params[:seasonings][:name])
    
      @user_seasonings << UserSeasoning.new(seasoning_id: s.id, user_id: seasoning_params[:user_id])
    
    end
    
    seasoning_params[:seasonings][:seasoning_ids].each do |sid|
    @user_seasonings << UserSeasoning.new(seasoning_id: sid, user_id: seasoning_params[:user_id])
    end
    
    # @seasoning = Seasoning.create(seasoning_params)
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
    if @user_seasonings.map(&:valid?).all?      
      @user_seasonings.each do |us|
        us.save
      end
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
