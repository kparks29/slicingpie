class GruntsController < ApplicationController

  def create
    if @current_user
      @grunt = Grunt.new()
      
      if @grunt.save()
        @user = User.new()
        @user.grunts.push(@grunt)
        @company = Company.find_by_id(params[:id].to_i)
        @company.grunts.push(@grunt)
        @user.companies.push(@company)
        @user.save
        @company.save
        redirect_to controller: 'users', action: 'edit', id: @grunt.user, grunt_id: @grunt.id
      else
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def show
    if @current_user
      @grunt = Grunt.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

  def edit
    if @current_user.grunts.first.is_leader
      @grunt = Grunt.find_by_id(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    if @current_user.grunts.first.is_leader
      @grunt = Grunt.find_by_id(params[:id])
      
      if grunt_params[:salary] == 0
        grunt_params[:salary] == grunt_params[:hourly_rate].to_f * 2000
      elsif grunt_params[:hourly_rate] == 0
        grunt_params[:hourly_rate] = grunt_params[:salary].to_f / 2000
      else
        grunt_params[:hourly_rate] = grunt_params[:salary].to_f / 2000
      end
      grunt_params[:ghrr] = ((grunt_params[:salary].to_f - grunt_params[:cash_compensation].to_f) / 2000) * 2
      #grunt_params[:equity] = 
      #grunt_params[:total_contributions] = 
      
      if @grunt.update(grunt_params)
        flash[:success] = "Your Grunt Profile was updated Successfully!"
        redirect_to @grunt
      else
        flash[:error] = "We were not able to update your Grunt profile, try again."
        render action: 'edit'
      end
    else
      redirect_to root_path
    end
  end

  private
  def grunt_params
    params.require(:grunt).permit(:start_date, :salary, :cash_compensation, :hourly_rate, :ghrr, :commission_rate, :company_id, :user_id, :title, :is_leader, :equity, :total_contributions)
  end

end
