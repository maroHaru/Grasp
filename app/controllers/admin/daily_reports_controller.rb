class Admin::DailyReportsController < ApplicationController
  
  def index
    # indexではなくてshowが必要かもしれないBookers2を参考にして確認
  end
  
  def show
    # @worker = Worker.find(params[:id])
    @daily_reports = @worker.daily_reports
  end
end
