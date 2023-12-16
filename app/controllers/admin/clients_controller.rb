class Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url

  def index
    @clients = Client.page(params[:page]).per(10)
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path
    else
      @clients = Client.page(params[:page]).per(10)
      render :index
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    redirect_to admin_clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name)
  end

  def admin_url
    request.fullpath.include?("/admin")
  end
end
