class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
    @daily_reports = @worker.daily_reports.order("created_at DESC").page(params[:page]).per(5)
  end

  def calendar
    @worker = Worker.find(params[:id])
    @timecards = @worker.timecards
    @daily_report = @worker.daily_reports
  end

  private

  def admin_url
    request.fullpath.include?("/admin")
  end

end
