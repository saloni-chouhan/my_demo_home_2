class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to current_user, notice: "You have successfully updated your profile."
    else
      render 'edit'
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :age, :phone, :designation, :admin)
  end

end
