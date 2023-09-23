class Worker::TimecardsController < ApplicationController

  def new
    @timecard = Timecard.new
  end

  def create
    # now = Time.current
    # deily_report = DailyReport.new
    # deily_report.worker_id = current_worker.id
    # deily_report.id = 1
    # deily_report.save
    timecard = Timecard.new(timecard_params)
    timecard.worker_id = current_worker.id
    timecard.daily_report_id = 1
    timecard.save
    redirect_to timecards_path
  end

  def index
    #@timecard = Timecard.find_by(memo: params[:timecard][:memo])
    #@timecards = current_worker.timecards
    pp "current-----------------------------#{current_worker.id}"
    #pp "@timecards---------------------------#{@timecards.inspect}"
    @timecards = Timecard.all
  end

  def timecard_params
    params.require(:timecard).permit(:daily_report_id, :worker_id,
    :client_id, :job_id, :to_do_id, :memo, :start_time, :end_time)
  end
end
