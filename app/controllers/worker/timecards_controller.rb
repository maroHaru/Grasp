class Worker::TimecardsController < ApplicationController

  def new
    @timecard = Timecard.new
  end

  def create
    now = Time.current
    timecard = Timecard.new(timecard_params)
    timecard.worker_id = current_worker.id
    timecard.save(start_time: now)
    redirect_to timecards_path
  end

  def index
    @timecards = Timecard.all
  end

  def timecard_params
    params.require(:timecard).permit(:daily_report_id, :worker_id,
    :client_id, :job_id, :to_do_id, :memo, :start_time, :end_time)
  end
end
