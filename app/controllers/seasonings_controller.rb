class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
    # @user_seasoning = @seasoning.user_seasonings.build
  end

  def create
    binding.pry
    # @user_seasonings = UserSeasoning.new
    # seasoning = Seasoning.create(seasoning_params)
    # @seasoning = @user_seasonings.build_seasoning(seasoning_params)
    # @seasoning = @user_seasonings.seasonings.build(seasoning_params)
    
    # @user_seasonings = seasoning.user_seasonings.build(seasoning_params)
    
    # @user = current_user
    # @seasoning = @user.seasonings.build(seasoning_params)
    
    # user_seasonings = UserSeasoning.new
    # @seasoning = Seasonig.new
    @seasoning = Seasonig.find_or_created_by(seasoning_params)
    @user_seasonings = @seasoning.user_seasonings.build({user_id: current_user.id}, {seasoning_id: @seasoning.id})
    # @user_seasonings = UserSeasoning.build({user_id: current_user.id}, {seasoning_id: @seasoning.id})
    
    if @user_seasonings.save
      redirect_to action: :index
    else
      render :new
    end
  end




  #   @user_seasonings = [] 
  #   if seasoning_params[:seasonings][:name].present?
  #     s = Seasoning.find_or_created_by(name: seasoning_params[:seasonings][:name])
  #     @user_seasonings << UserSeasoning.new(seasoning_id: s.id, user_id: seasoning_params[:user_id])
  #   end
    
  #   seasoning_params[:seasonings][:seasoning_ids].each do |sid|
  #     @user_seasonings << UserSeasoning.new(seasoning_id: sid, user_id: seasoning_params[:user_id])
  #   end
    
  #   if @user_seasonings.map(&:valid?).all?      
  #     @user_seasonings.each do |us|
  #       us.save
  #     end
  #     redirect_to action: :index
  #   else
  #     render :new
  #   end
  # end

  private
  
  def seasoning_params
    params.require(:seasoning).permit(:name, :user_created_at, :created_at, :updated_at, :user_id, user_ids: [], :seasoning_id, seasoning_ids: [], seasonings: {}).merge(user_id: current_user.id)
  end

end
