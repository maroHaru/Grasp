class Admin::DailyReportsController < ApplicationController

  def index
    @worker = Worker.find(params[:id])
    @daily_reports = @worker.daily_reports
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    @timecards = @daily_report.timecards
    @comment = Comment.new
    @comments = @daily_report.comments
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
end
