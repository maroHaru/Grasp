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
    flash[:notice] = "コメントが送信されました。"
    redirect_to admin_daily_report_path(daily_report.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    @notification = Notification.find_by_action_and_action_id("comment", comment.id)
    @notification.update!(is_checked: true)
    comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to admin_daily_report_path(params[:daily_report_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)

  end
end
