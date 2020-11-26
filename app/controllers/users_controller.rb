class UsersController < ApplicationController

  def show
  end

  private user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :favorite_dish, :profile, :image).merge(seasoning_id: current_user.id)
end
end