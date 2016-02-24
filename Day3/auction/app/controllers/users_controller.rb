class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to action: 'index', controller: 'users'
    else
      render 'new'
    end
  end


  def index
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to action: 'index'
    else
      render 'edit'
    end

  end





  private

  # def user
  #   @_user ||= User.find(params[:user_id])
  # end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
