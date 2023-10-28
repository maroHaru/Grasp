class Worker::NotificationsController < ApplicationController
  
  def index
    # @notifications = Notification.all
    @notifications = Notification.where(visited_id: current_worker.id).where(is_checked: false).order(created_at: :desc)
  end

  def update
  end
end
