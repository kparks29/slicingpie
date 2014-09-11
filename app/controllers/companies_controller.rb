class CompaniesController < ApplicationController
  
  def index
    if @current_user
      @companies = Company.all
    else
      redirect_to root_path
    end
  end

  def new
    if @current_user
      @company = Company.new
    else
      redirect_to root_path
    end
  end

  def create
    if @current_user
      @company = Company.new(company_params)
      @company.users.push(@current_user)
      @grunt = Grunt.create(start_date: Time.now, company_id: @company.id, user_id: @current_user.id, is_leader: true)
      @company.grunts.push(@grunt)

      if @company.save
        flash[:success] = "Successfully created a company"
        redirect_to edit_grunt_path(@grunt)
      else
        flash[:error] = "Invalid name"
        render action: 'new'
      end
    else
      redirect_to root_path
    end
  end

  def show
    if @current_user
      @company = Company.find_by(id: params[:id])
    else
      redirect_to root_path
    end
  end

  private
  def company_params
    params.require(:company).permit(:name)
  end

end
