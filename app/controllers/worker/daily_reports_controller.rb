class Worker::DailyReportsController < ApplicationController

  def create
    daily_report = DailyReport.new(daily_report_params)
    deily_report.worker_id = current_worker.id
    daily_report.is_reported = true
    deily_report.save
    redirect_to daily_reports_path
  end

  def index
    @daily_reports = current_worker.daily_reports
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    @timecards = current_worker.timecards
    total = []
    @daily_report.timecards.each do |card|
    # @daily_report = card.daily_report
      if card.end_time == nil || card.start_time == nil
        next
      end
      diff = card.end_time - card.start_time
      total << diff
    end
      @total = Time.at(total.sum).utc.strftime('%R')
  end

  def report
    @daily_report = DailyReport.find(params[:daily_report][:daily_report_id])
    @daily_report.update(is_reported: true)
    redirect_to timecards_path
    @timecards = @daily_report.timecards
  end


  def daily_report_params
    params.require(:daily_report).permit(:worker_id, :is_reported, :reported_date)
  end
end
