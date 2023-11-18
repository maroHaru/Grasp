module Worker::NotificationsHelper
  def unchecked_notifications
    @notifications = Notification.where(visited_id: current_worker.id).where(is_checked: false)
  end
end
