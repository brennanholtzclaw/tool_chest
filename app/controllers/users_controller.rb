class UsersController < ApplicationController

  def index

  end

  def new

  end

  def create
    user = User.new(user_params)
    if user.save
      @user = user
      session[:user_id] = user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
