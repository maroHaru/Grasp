class Worker::TimecardsController < ApplicationController

  def new
    @timecard = Timecard.new
  end

  def create
    # now = Time.current
    timecard = Timecard.new(timecard_params)
    today = Date.today

    @daily_report = current_worker.daily_reports.find_by(reported_date: today)
    # if params[:daily_report] != nil && params[:daily_report][:today]
    #   reported_date = params[:daily_report][:today]
    # end
    if @daily_report.present?
      timecard.worker_id = current_worker.id
      timecard.start_time = Time.current
      timecard.daily_report_id = @daily_report.id
      timecard.save!
      redirect_to timecards_path
    else
      @daily_report = DailyReport.new
      @daily_report.worker_id = current_worker.id
      @daily_report.is_reported = false
      @daily_report.reported_date = today
      @daily_report.save!
      timecard.daily_report_id = @daily_report.id
      timecard.worker_id = current_worker.id
      timecard.start_time = Time.current
      timecard.save!
      redirect_to timecards_path
    end
  end

  def index
    pp "current-----------------------------#{current_worker.id}"
    # @daily_report = DailyReport.find(params[:daily_report][:daily_report_id])
    # @daily_report = @timecards.daily_report
    @timecards = current_worker.timecards.where(start_time: Time.current.beginning_of_day...Time.current.end_of_day)
    # @timecard_all = DailyReport.find(params[:daily_report][:daily_report_id])
    # @daily_report = DailyReport.find(params[:id])
    # @daily_report = DailyReport.find(params[:daily_report][:daily_report_id])
    # @daily_report = DailyReport.find(params[:daily_report])
    total = []
    @timecards.each do |card|
    @daily_report = card.daily_report
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
