class RewardsController < ApplicationController
  def index
    @rewards = Reward.filter(params).page(params[:page])
  end
end
