class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

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
    params.require(:user).permit(:name, :age, :phone, :airport_id,:role_id)
  end

end
