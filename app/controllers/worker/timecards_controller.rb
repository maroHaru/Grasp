class Worker::TimecardsController < ApplicationController
  before_action :is_matching_login_worker, only: [:edit, :update]

  def new
    @timecard = Timecard.new
  end

  def create
    timecard = Timecard.new(timecard_params)
    today = Date.today

    @daily_report = current_worker.daily_reports.find_by(reported_date: today)
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
    @to_do = ToDo.new
    @to_dos = current_worker.to_dos.where(is_completed: false)
    @timecards = current_worker.timecards.where(start_time: Time.current.beginning_of_day...Time.current.end_of_day)

    today = Date.today
    @daily_report = current_worker.daily_reports.find_by(reported_date:  today)
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

  def compare
    @timecards = current_worker.timecards.sort {|a,b| b.amount_of_time <=> a.amount_of_time}
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

  private


  def timecard_params
    params.require(:timecard).permit(:daily_report_id, :worker_id, :client_id, :job_id, :to_do_id, :memo, :start_time, :end_time)
  end

  def is_matching_login_worker
    timecard = Timecard.find(params[:id])
    unless timecard.worker_id == current_worker.id
      redirect_to timecards_path
    end
  end

end
