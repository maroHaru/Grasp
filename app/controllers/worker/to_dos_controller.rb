class Worker::ToDosController < ApplicationController

  def index
    @to_do = ToDo.new
    @complete_to_dos = current_worker.to_dos.where(is_completed: true).order('id DESC')
  end

  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.worker_id = current_worker.id
    if @to_do.save
      redirect_to timecards_path
    else
      @complete_to_dos = current_worker.to_dos.where(is_completed: true).order('id DESC')
      render :index
    end
  end

  def update
    to_do = ToDo.find(params[:id])
    to_do.update(to_do_params)
    redirect_to to_dos_path

  end

  def destroy
  end

  def complete
    today = Date.today
    to_do = ToDo.find(params[:to_do][:to_do_id])
    to_do.update(completed_date: today, is_completed: true)
    redirect_to to_dos_path
  end

  def complete_all

  end


  private

  def to_do_params
    params.require(:to_do).permit(:worker_id, :name, :completed_date, :is_completed)
  end
end
