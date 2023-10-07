class Admin::CommentsController < ApplicationController

  def create
    daily_report = DailyReport.find(params[:daily_report_id])
    comment = current_admin.comments.new(comment_params)
    comment.daily_report_id = daily_report.id
    comment.save
    redirect_to admin_worker_path(daily_report.worker.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
