class UsersController < ApplicationController

  def new
    flash[:data] ? @user = User.new(flash[:data]) : @user = User.new
    @user.tags.build
  end

  def create
    user = User.new(get_params)
    if user.save
      session[:user_id] = user.id
      session[:profile] = %w(email dob loc)
      redirect_to user_path(user)
    else
      flash[:errors] = user.errors.full_messages
      flash[:data] = user
      redirect_to "/users/new"
    end
  end

  def destroy
    @user = User.find(params[:id])
    Usertag.where(user_id: "#{@user.id}").delete_all
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
    if @current_user
      @wner = @current_user.name == @user.name
    end 
    @events = @user.events
  end

  def edit
    @user = User.find(params[:id])
    @user.tags.build
  end

  def update
    user = User.find(params[:id])
    if user.update(get_params)
      if user.email == nil || user.email == ""
        session[:profile].delete('email')
      else
        session[:profile] << 'email' unless session[:profile].include?('email')
      end
      if user.dob == nil || user.dob == ""
        session[:profile].delete('dob')
      else
        session[:profile] << 'dob' unless session[:profile].include?('dob')
      end
      if user.loc == nil || user.loc == ""
        session[:profile].delete('loc')
      else
        session[:profile] << 'loc' unless session[:profile].include?('loc')
      end
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