class Admin::WorkersController < ApplicationController

  def index
    @workers = Worker.all
  end
end
