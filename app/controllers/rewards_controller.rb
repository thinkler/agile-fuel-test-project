class RewardsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rewards = Reward.includes(:user)
                     .filter(reward_filters_params)
                     .page(params[:page])
  end
end
