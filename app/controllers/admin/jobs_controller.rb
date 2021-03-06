class Admin::JobsController < ApplicationController
  before_action :require_is_admin
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  layout "admin"

  def show
    @job = Job.find(params[:id])
  end

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy

    redirect_to admin_jobs_path
  end
  def open
    @job = Job.find(params[:id])
      @job.open!
    redirect_to :back
  end
  def close
    @job = Job.find(params[:id])
      @job.close!
    redirect_to :back
  end

  private

  def job_params
    params.require(:job).permit(:title, :string, :description, :wage_upper_bound, :wage_down_bound, :contact_email, :is_hidden)
  end

end
