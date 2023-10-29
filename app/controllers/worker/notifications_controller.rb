class Worker::NotificationsController < ApplicationController

  def index
    # @notifications = Notification.all
    @notifications = Notification.where(visited_id: current_worker.id).where(is_checked: false).order(created_at: :desc)
  end

  def update
    @notification = Notification.find(params[:id])
    @notification.update(is_checked: true)
    redirect_to notifications_path
  end

  private

  def notification_params
    params.require(:notification).permit(:visiter_id, :visited_id, :action_id, :action, :is_checked)
  end

end
