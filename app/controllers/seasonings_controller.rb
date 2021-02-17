class SeasoningsController < ApplicationController

  def index
      @categories = RakutenWebService::Recipe.large_categories
      @recipes = @categories.first.ranking
  end

  def new
    @seasoning = Seasoning.new
  end

  def create
    @user = current_user
    if seasoning_params[:seasonings][:name].present?
      @seasoning = Seasoning.find_or_create_by(name: seasoning_params[:seasonings][:name])
      @user.seasonings << @seasoning
    else
    end

    seasonings_ary = seasoning_params[:seasonings][:seasoning_ids].compact   #nullに対するmysplエラー対応の際,nillを取り除くcompactメソッドを使用してみたもの。今回の処理には不要なもの
    seasonings_ary.each do |sid|
    # seasoning_params[:seasonings][:seasoning_ids].each do |sid|...compactメソッドを使用する前の記述
      @seasoning = Seasoning.find_by(id: sid)
      if @seasoning.present? && @user.seasonings.find_by(id: sid).nil?   #sidはnewで新しく生成するのではなく既存登録から選択するデータのため、選択された調味料はあるか・すでにユーザー調味料として登録済みではないかを確認してから保存させる。
        @user.seasonings << @seasoning
      end
      # @seasoning = Seasoning.new(name: sid)・・・newした時点ではsidは空の状態のためnameに対してnullはだめというmysqlエラーになっていた
      # @user.seasonings << @seasoning
    end

    # if @user.seasonings.save ・・・配列データに対してはsaveメソッドは無いためエラーになる
    if @user.seasonings.map(&:valid?).all?       #mapメソッドは処理の実行結果を配列に入れて返してくれる(valid?で真偽検証)
      @user.seasonings.each do |us|
        us.save
      end
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
