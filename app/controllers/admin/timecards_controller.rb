class Admin::TimecardsController < ApplicationController

  def index
    # @worker = Worker.find(params[:id])
    @timecards = Timecard.all
    # @timecards = @worker.timecards
  end


end
