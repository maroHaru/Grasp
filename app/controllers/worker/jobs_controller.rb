class Worker::JobsController < ApplicationController

  def create
    @job = Job.new(job_params)
    @job.worker_id = current_worker.id
    @job.save
    redirect_to jobs_path
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
end
