class Admin::CommentsController < ApplicationController

  def create
    daily_report = DailyReport.find(params[:daily_report_id])
    # comment = current_admin.comments.new(comment_params)
    @comment = daily_report.comments.build(comment_params)
    @comment.daily_report_id = daily_report.id
    # comment = daily_report.comments.build(comment_params)
    @comment.admin_id = current_admin.id
    if @comment.save
      Notification.create!({visiter_id: current_admin.id, visited_id: daily_report.worker_id, action_id: @comment.id, action: 'comment'})
      # comment.notifications.build({visiter_id: current_admin, visited_id: daily_report.worker_id, action_id: comment.id, action: 0})
    end
    redirect_to admin_worker_path(daily_report.worker.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
