class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  private 
  def user_params
    params.require(:user).permit(:nickname, :favorite_dish, :profile, :image).merge(user_id: current_user.id)
  end

end