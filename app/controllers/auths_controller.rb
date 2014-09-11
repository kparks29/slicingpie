class AuthsController < ApplicationController


  def create
    user = User.find_by(email: params[:user][:email])
    if user.authenticated?(params[:user][:password])
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
