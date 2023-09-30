class Worker::DailyReportsController < ApplicationController

  def create
    daily_report = DailyReport.new(daily_report_params)
    deily_report.worker_id = current_worker.id
    daily_report.is_reported = true
    deily_report.save
    redirect_to daily_reports_path
  end

  def index
  end

  def show
    @daily_report = DailyReport.find(params[:id])
  end

  def report
    @daily_report = DailyReport.find(params[:is_reported])
    @daily_report.update(is_reported: true)
    redirect_to timecards_path
    @timecards = @daily_report.timecards
  end


  def daily_report_params
    params.require(:daily_report).permit(:worker_id, :is_reported, :reported_date)
  end
end
