class Worker::NotificationsController < ApplicationController

  def index
    # @notifications = Notification.all
    # @notifications = Notification.where(visited_id: current_worker.id).where(is_checked: false).order('id DESC').limit(3)
    @notifications = Notification.where(visited_id: current_worker.id).order('id DESC').limit(3)
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(is_checked: true)
    redirect_to daily_reports_path
  end

  private

  def notification_params
    params.require(:notification).permit(:visiter_id, :visited_id, :action_id, :action, :is_checked)
  end

end
