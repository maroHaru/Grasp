class Admin::CommentsController < ApplicationController

  def create
    daily_report = DailyReport.find(params[:daily_report_id])
    @comment = daily_report.comments.build(comment_params)
    @comment.daily_report_id = daily_report.id
    @comment.admin_id = current_admin.id
    if @comment.save
      Notification.create!({visiter_id: current_admin.id, visited_id: daily_report.worker_id, action_id: @comment.id, action: 'comment'})
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
