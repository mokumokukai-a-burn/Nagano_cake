class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if admin_admin_signed_in?
      admin_root_path            #注文履歴
    elsif customer_signed_in?
      "/"
    end
  end

  def after_sign_out_path_for(resource)
      new_admin_admin_session_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,:first_name,:last_name_kana,:first_name_kana,:street_address,:post_number,:phone_number,:is_deleted,:email])
  end
end
