class Worker::NotificationsController < ApplicationController

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
