class Worker::HomesController < ApplicationController
  def top
    @to_do = ToDo.new
    @to_dos = current_worker.to_dos.where(is_completed: false)
  end

  def about
  end
end
