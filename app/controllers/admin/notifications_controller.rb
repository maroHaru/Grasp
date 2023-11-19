class Admin::NotificationsController < ApplicationController

  def index
    @notifications = Notification.where(visiter_id: current_admin.id).where(is_checked: false).order(created_at: :desc)
  end

  def update
  end
end
