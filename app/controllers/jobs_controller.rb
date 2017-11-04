class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  def index
    @jobs = Job.all.order('created_at DESC')
  end

  def show

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(jobs_params)

    if @job.save
      redirect_to @job, notice: "Job was created successfully."
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @job.update_attributes(jobs_params)
      redirect_to @job, notice: "Job was updated successfully."
    else
      render 'edit', notice: "Job failed to create"
    end
  end

  def destroy
    @job.destroy
    redirect_to root_path
  end

  private

  def jobs_params
    params.require(:job).permit(:title, :description, :company, :url)
  end

  def set_job
    @job = Job.find(params[:id])
  end
end
