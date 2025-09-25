class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to dashboard_path, notice: "Congrats, your profile is updated !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
    redirect_to root_path, alert: "Not allowed." unless @user == current_user
  end

  def user_params
    params.require(:user).permit(:bio, :location, :avatar)
  end
end
