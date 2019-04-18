class SessionsController < ApplicationController

    def login
    end

    def logged
      user = User.find_by(name: params[:user][:name])
      if user && user.authenticate(params[:user][:password])

        session[:user_id] = user.id

        redirect_to user_path(user)
      else
        flash[:notice] = "Wrong credentials!"
        redirect_to new_user_path
      end
    end

    def logout
      session[:user_id] = nil
      redirect_to '/'
    end
  end