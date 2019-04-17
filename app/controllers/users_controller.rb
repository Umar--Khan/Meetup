class UsersController < ApplicationController

  def new
    flash[:data] ? @user = User.new(flash[:data]) : @user = User.new
    @user.tags.build
  end

  def create
    user = User.new(get_params)
    if user.save
      session[:user_id] = user.id
      session[:profile] = 3
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      flash[:data] = user
      redirect_to "/users/new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    session[:user_id] = nil
    redirect_to '/'
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @tags = @user.tags
  end

  def edit
    @user = User.find(params[:id])
    @user.tags.build
  end

  def update
    user = User.find(params[:id])
    byebug
    if user.update(get_params)
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      redirect_to "/users/#{user.id}/edit"
    end
  end

  private

  def get_params
    params.require(:user).permit(
      :name,
      :email,
      :dob,
      :loc,
      :password,
      tags_attributes: [:main_tag])
  end

end