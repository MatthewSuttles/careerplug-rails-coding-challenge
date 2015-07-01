class JobsController < ApplicationController
  before_filter :authenticate_user!
  def index
    if params[:search]
      @jobs = Job.where("jobs.name Like ?", "%#{params[:search]}%").includes(:comments)
      @result_count = @jobs.count
    else
      @jobs = Job.where(user_id: current_user.id).includes(:comments)
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(permitted_params)
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to root_path, notice: 'Your job has been posted.' }
      else
        format.html { render :new }
      end
    end
  end


  private

  def permitted_params
    params.require(:job).permit(:name, :description, :status, :employment_type)
  end
end
