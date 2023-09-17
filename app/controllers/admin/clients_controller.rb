class Admin::ClientsController < ApplicationController
  
  def index
    @clients = Client.all
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.save
    redirect_to admin_clients_path
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
end