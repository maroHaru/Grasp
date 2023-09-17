class Worker::JobsController < ApplicationController
  
  def index
    @jobs = Job.all
    @job = Job.new
  end
  
  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to jobs_path
  end
  
  private

  def job_params
    params.require(:job).permit(:worker_id, :description)

  end
end
