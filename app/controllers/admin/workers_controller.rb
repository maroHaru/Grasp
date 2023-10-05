class Admin::WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.find(params[:id])
    @daily_reports = @worker.daily_reports
  end
end
