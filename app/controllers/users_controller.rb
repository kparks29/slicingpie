class UsersController < ApplicationController

  def index
  end

  def new
    if current_user
      flash[:notice] = "Already logged in"
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Successfully created an account!"
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = "Wrong email or password!"
      render action: 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmed_password)
  end

end
