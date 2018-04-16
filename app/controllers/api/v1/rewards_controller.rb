module Api
  module V1
    class RewardsController < Api::V1::BaseApiController
      before_action :authenticate_user!

      resource_description do
        short "User's rewards"
        description <<-DESCRIPTION
          == Authentication
          To fetch rewards, please provide following headers:
            uid: A unique value that is used to identify the user (equal to user email)
            expiry: The date at which the current session will expire
            token-type: Should be 'Bearer'
            access-token: This serves as the user's password for each request
            client: This enables the use of multiple simultaneous sessions on different clients
        DESCRIPTION
      end

      api :GET, '/rewards', 'Returns all rewards with metadata'
      param :filter, String, "Set to filter by #{Reward::FILTERING_AVAILABLE} fields"
      param :order, String,
            "Set to order by #{Reward::ORDERING_AVAILABLE} fields. Put minus before ordering field \
             to set ordering direction to :desc, default direction is :asc. Example: order=-id"
      param :page, :number, 'Set to select page'
      param :per_page, :number, 'Set to select records per page'
      meta meta: { total_count: 'Total rewards count',
                   page: 'Current page',
                   per_page: 'Rewards per page' }
      def index
        rewards = Reward.includes(:user)
                        .filter(reward_filters_params)
                        .page(params[:page])
                        .per(params[:per_page])
        render_success(rewards)
      end

      api :GET, '/rewards/:id', 'Returns reward by id'
      param :id, :number, required: true
      def show
        if (reward = Reward.find_by(id: params[:id]))
          render_success(reward)
        else
          render_errors(['Not found'], :not_found)
        end
      end
    end
  end
end
