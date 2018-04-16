class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?
  protect_from_forgery with: :null_session, only: proc { |c| c.request.format.json? }

  private

  def reward_filters_params
    params.permit(Reward::FILTERING_AVAILABLE + [:order])
  end

  def configure_permitted_params
    added_attrs = %i[name email password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
