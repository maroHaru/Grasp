# frozen_string_literal: true

class Worker::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
    flash[:notice] = "Hello!"
    timecards_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end
  def guest_sign_in
    worker = Worker.guest
    sign_in worker
    flash[:notice] = "Hello!"
    redirect_to timecards_path
  end

  def guest_sign_out
    worker = Worker.guest
    sign_out worker
    redirect_to root_path
  end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
