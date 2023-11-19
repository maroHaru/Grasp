class Admin::TimecardsController < ApplicationController

  def index
    @timecards = Timecard.all

  end

  def show
    @timecard = Timecard.find(params[:id])
  end


end
