class Admin::DailyReportsController < ApplicationController

  def index
    # @daily_report = DailyReport.all
    @timecards = @daily_report.timecards
    # indexではなくてshowが必要かもしれないBookers2を参考にして確認
  end

  def show
    @daily_report = DailyReport.find(params[:id])
    # @worker = Worker.find(params[:id])
    @timecards = @daily_report.timecards
    @comment = Comment.new
    # total = []
    # @daily_report.timecards.each do |card|
    # # @daily_report = card.daily_report
    #   if card.end_time == nil || card.start_time == nil
    #     next
    #   end
    #   diff = card.end_time - card.start_time
    #   total << diff
    # end
    #   @total = Time.at(total.sum).utc.strftime('%R')
  end
end
