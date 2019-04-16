class SessionsController < ApplicationController 

    def login
    end
  
    def loggedin
      user = User.find_by(name: params[:user][:name])
      byebug
      if user && user.authenticate(params[:user][:password])
  
        session[:user_id] = user.id
  
        redirect_to user_path(user)
      else
        flash[:notice] = "Wrong credentials! You dun goofed!"
        redirect_to "/login"
      end
    end
  
    def logout
      session[:user_id] = nil
      redirect_to "/login"
    end
  end