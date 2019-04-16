class UsersController < ApplicationController

  def new
    flash[:data] ? @user = User.new(flash[:data]) : @user = User.new
  end

  def create
    user = User.new(get_params)
    if user.save
      byebug
      redirect_to user_path user
    else
      flash[:errors] = user.errors.full_messages
      flash[:data] = user
      redirect_to new_user_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(get_params)
      redirect_to user_path user
    else
      flash[:errors] = user.errors.full_messages
      redirect_to users_edit
    end
  end

  private

  def get_params
    params.require(:user).permit(:name, :email, :dob, :loc, :password)
  end

end