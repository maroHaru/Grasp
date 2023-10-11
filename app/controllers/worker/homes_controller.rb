class Worker::HomesController < ApplicationController
  def top

  end

  def about
    @to_do = ToDo.new
    @to_dos = current_worker.to_dos.where(is_completed: false)
    @timecards = current_worker.timecards
  end
end
