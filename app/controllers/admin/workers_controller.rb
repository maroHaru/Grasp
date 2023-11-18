class Admin::WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
    @daily_reports = @worker.daily_reports.order("created_at DESC").page(params[:page]).per(5)
    # @comments = @daily_report.comments
  end

  def calendar
    @worker = Worker.find(params[:id])
    @timecards = @worker.timecards
    @daily_report = @worker.daily_reports
    # @daily_report = DailyReport.find(params[:id])
  end
end
