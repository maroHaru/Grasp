class Worker::DailyReportsController < ApplicationController
  before_action :is_matching_login_worker, only: [:show]

  def create
    daily_report = DailyReport.new(daily_report_params)
    deily_report.worker_id = current_worker.id
    daily_report.is_reported = true
    deily_report.save
    redirect_to daily_reports_path
  end

  def index
    @daily_reports = current_worker.daily_reports.order("created_at DESC").page(params[:page]).per(5)
    @notifications = Notification.all
    @notification = Notification.where(visited_id: current_worker.id)
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    @comments = @daily_report.comments
    @comment = @daily_report.comments.first
    @notification = false
    if @comment.present?
      @notification = Notification.where(visited_id: current_worker.id).where(action_id: @comment.id).first

    end
    @timecards = current_worker.timecards
    total = []
    @daily_report.timecards.each do |card|
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
    flash[:notice] = "日報が提出されました。"
    redirect_to timecards_path
    @timecards = @daily_report.timecards
  end

  private


  def daily_report_params
    params.require(:daily_report).permit(:worker_id, :is_reported, :reported_date)
  end

  def is_matching_login_worker
    daily_report = DailyReport.find(params[:id])
    unless daily_report.worker_id == current_worker.id
      redirect_to daily_reports_path
    end
  end

end
