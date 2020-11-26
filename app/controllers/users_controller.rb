class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private 
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :favorite_dish, :profile, :image).merge(user_id: current_user.id)
  end

end