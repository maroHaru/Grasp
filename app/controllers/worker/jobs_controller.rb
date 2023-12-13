class Worker::JobsController < ApplicationController
  before_action :is_matching_login_worker, only: [:edit, :update]

  def create
    @job = Job.new(job_params)
    @job.worker_id = current_worker.id
    if @job.save
      redirect_to jobs_path
    else
      @jobs = current_worker.jobs
      render :index
    end
  end

  def index
    @jobs = current_worker.jobs
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    redirect_to jobs_path
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:worker_id, :description)
  end

  def is_matching_login_worker
    job = Job.find(params[:id])
    unless job.worker_id == current_worker.id
      redirect_to jobs_path
    end
  end

end
