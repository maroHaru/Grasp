class Admin::CommentsController < ApplicationController

  def create
    @daily_report = DailyReport.find(params[:daily_report_id])
    comment = @daily_report.comments.build(comment_params)
    comment.admin_id = current_admin.id
    comment.notifications.build({visiter_id: current_admin, visited_id: @daily_report.worker_id, action: 0})
    comment.save
    redirect_to admin_worker_path(daily_report.worker.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
