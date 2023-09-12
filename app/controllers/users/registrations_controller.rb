class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: :create

  prepend_before_action :require_no_authentication, only: [:cancel]


  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: policy(User).permitted_attributes)
  end
end
