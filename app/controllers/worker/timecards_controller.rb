class Worker::TimecardsController < ApplicationController

  def new
    @timecard = Timecard.new
  end

  def create
    now = Time.current
    timecard = Timecard.new(timecard_params)
    today = Date.today
    if DailyReport.find_by(reported_date: params[:daily_report][:today])
      timecard.worker_id = current_worker.id
      timecard.start_time = now
      # timecard.daily_report_id = 1
      timecard.save!
      redirect_to timecards_path
    else @daily_report = DailyReport.new
      daily_report.worker_id = current_worker.id
      daily_report.is_reported = false
      daily_report.reported_date = today
      daily_report.save!
      timecard.start_time = now
      timecard.save!
      redirect_to timecards_path
    end
  end

  def index
    pp "current-----------------------------#{current_worker.id}"
    @daily_report = DailyReport.find(params[:daily_report][:daily_report_id])
    @daily_report = @timecards.daily_report
    @timecards = Timecard.all
    # @timecard_all = DailyReport.find(params[:daily_report][:daily_report_id])
    # @daily_report = DailyReport.find(params[:id])
    # @daily_report = DailyReport.find(params[:daily_report][:daily_report_id])
    # @daily_report = DailyReport.find(params[:daily_report])
    total = []
    @timecards.each do |card|
      if card.end_time == nil || card.start_time == nil
        next
      end
      diff = card.end_time - card.start_time
      total << diff
    end
    @total = Time.at(total.sum).utc.strftime('%R')
  end

  def edit
    @timecard = Timecard.find(params[:id])
  end

  def update
    timecard = Timecard.find(params[:id])
    timecard.update(timecard_params)
    redirect_to timecards_path
  end

  def finish
    now = Time.current
    timecard = Timecard.find(params[:timecard_id])
    timecard.end_time = now
    timecard.update(end_time: now)
    redirect_to timecards_path
  end

  def destroy
    timecard = Timecard.find(params[:id])
    timecard.destroy
    redirect_to timecards_path
  end


  def timecard_params
    params.require(:timecard).permit(:daily_report_id, :worker_id, :client_id, :job_id, :to_do_id, :memo, :start_time, :end_time)
  end
end
