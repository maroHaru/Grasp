class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url

  def top
  end

  private

  def admin_url
    request.fullpath.include?("/admin")
  end

end
