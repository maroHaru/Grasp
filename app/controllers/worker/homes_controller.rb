class Worker::HomesController < ApplicationController
  def top

  end

  def about
    @timecards = current_worker.timecards
  end
end
