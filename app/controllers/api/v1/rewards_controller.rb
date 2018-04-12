module Api
  module V1
    class RewardsController < ApplicationController
      def index
        rewards = Reward.filter(params)
                        .page(params[:page])
                        .per(params[:per_page])
        render json: rewards, status: 200
      end

      def show
        reward = Reward.find(params[:id])
        render json: reward, status: 200
      end
    end
  end
end
