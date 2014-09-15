class AuthsController < ApplicationController


  def create
    user = User.find_by(email: params[:user][:email])
    if user.authenticated?(params[:user][:password])
      flash[:success] = "Signed In Successfully"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid Login Info"
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
