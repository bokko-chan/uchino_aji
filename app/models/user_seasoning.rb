class UserSeasoning < ApplicationRecord
  belongs_to :user
  belongs_to :seasoning

### 登録済み意外の調味料があるレシピをはじいて結果を返す検索機能の実装
  def self.recipe_search(search)
    # UserSeasoning.where(:name LIKE, "%#{search}%")
    if params[:search] !=""
      @recipe_result = RakutenWebService::Recipe.match(params[:search])
        if @recipe_result.where(:recipe_category LIKE, "%#{current_user.seasonings.name}%")
        # if UserSeasoning.where(:name LIKE, "%#{current_user.seasonings.name}%")


    # if current_user.seasonings.name.match

    end
  end


end
