class UsersController < ApplicationController

  def index
  end

  def new
    if @current_user
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

  def edit
    if @current_user
      @user = User.find_by_id(params[:id].to_i)
    else
      redirect_to root_path
    end
  end

  def update
    if @current_user
      @user = User.find_by_id(params[:id].to_i)
      if @user.update(user_params)
        if @current_user != @user
          redirect_to edit_grunt_path(Grunt.find_by_id(extra_params[:grunt_id].to_i))
        else
          flash[:success] = "Profile Updated"
          redirect_to @user
        end
      else
        render action: 'edit'
      end
    else
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :confirmed_password)
  end
  def extra_params
    params.require(:user).permit(:grunt_id)
  end

end
