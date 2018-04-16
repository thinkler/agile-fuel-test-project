class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, only: proc { |c| c.request.format.json? }

  private

  def reward_filters_params
    params.permit(Reward::FILTERING_AVAILABLE + [:order])
  end
end
