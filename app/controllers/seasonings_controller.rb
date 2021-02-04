class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
  end

  def create
    # @user = User.new
    # @user = current_user
    # @seasoning = Seasoning.new
    # @user.seasonings << @seasoning

    # @seasoning = Seasoning.new(seasoning_params)
    # @seasoning = Seasoning.new(seasoning_id: seasoning_params[:seasonings][:seasoning_ids])
    # @user.seasonings.ids << @seasoning


    # @user.seasonings.ids
    # @seasonings << Seasoning.new
    # @seasoning = Seasoning.new(seasoning_params)
    # @seasoning = Seasoning.new(seasoning_params[user_id:current_user.id])

    @user = current_user
    if seasoning_params[:seasonings][:name].present?
      @seasoning = Seasoning.find_or_create_by(name: seasoning_params[:seasonings][:name])
      @user.seasonings << @seasoning
    else
    end

    seasonings_ary = seasoning_params[:seasonings][:seasoning_ids].compact
    seasonings_ary.each do |sid|
    # seasoning_params[:seasonings][:seasoning_ids].each do |sid|
      @seasoning = Seasoning.new(id: sid)
      # binding.pry
      @user.seasonings << @seasoning
    end

    # binding.pry
    if @user.seasonings.save
      redirect_to action: :index
    else
      render :new
    end
  end

  #   ActiveRecord Associationを利用せず保存させる場合の記述
  #   @user_seasonings = [] 
  #   if seasoning_params[:seasonings][:name].present?
  #     s = Seasoning.find_or_create_by(name: seasoning_params[:seasonings][:name])
  #     @user_seasonings << UserSeasoning.new(seasoning_id: s.id, user_id: seasoning_params[:user_id])
  #   end
    
    # seasoning_params[:seasonings][:seasoning_ids].each do |sid|
    #   @user_seasonings << UserSeasoning.new(seasoning_id: sid, user_id: seasoning_params[:user_id])
    # end
    
    # if @user_seasonings.map(&:valid?).all?      
    #   @user_seasonings.each do |us|
    #     us.save
    #   end
    #   redirect_to action: :index
    # else
    #   render :new
    # end
  # end

  private
  
  def seasoning_params
    params.require(:seasoning).permit(:name, :user_created_at, :created_at, :updated_at, seasoning_ids: [], seasonings: {}).merge(user_id: current_user.id)
  end

end
