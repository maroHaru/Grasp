class Admin::DailyReportsController < ApplicationController
  
  def index
    # indexではなくてshowが必要かもしれないBookers2を参考にして確認
  end
  
  def show
    @daily_report = DailyReport.find(params[:id])
    # @worker = Worker.find(params[:id])
    @timecards = @daily_report.timecards
  end
end
