class Admin::DailyReportsController < ApplicationController

  def index
    @daily_report = DailyReport.all
    # indexではなくてshowが必要かもしれないBookers2を参考にして確認
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    # @worker = Worker.find(params[:id])
    @timecards = @daily_report.timecards
    @comment = Comment.new
  end
end
