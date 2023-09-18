class Worker::ToDosController < ApplicationController

  def index
    @to_do = ToDo.new
    @to_dos = ToDo.where(is_completed: "false")
    @complete_to_dos = ToDo.where(is_completed: "true")
    # @to_dos = ToDo.all (←未完了も完了も全て表示されてしまう。。)
    # ToDo.where(is_completed: "false") ←完了ステータスがFALSEのものだけ表示する事が可能
  end

  def create
    @to_do = ToDo.new(to_do_params)
    @to_do.worker_id = current_worker.id
    @to_do.save
    redirect_to to_dos_path
  end

  def update

  end

  def destroy
  end

  def complete
    @to_do = ToDo.find(params[:id])
    # @to_do.worker_id = current_worker.id
    @to_do.update(is_completed: true)
    redirect_to to_dos_path
  end

  def complete_all
    # ○○ = ToDo.where(is_completed: "true")←完了ステータスがtrueのものだけ表示する事が可能
  end



  private

  def to_do_params
    params.require(:to_do).permit(:worker_id, :name, :completed_date, :is_completed)
  end
end
