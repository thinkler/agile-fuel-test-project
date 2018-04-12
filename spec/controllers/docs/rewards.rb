module Docs
  module V1
    module Reward
      extend Dox::DSL::Syntax

      document :api do
        resource 'Rewards' do
          endpoint '/rewards'
        end
      end

      document :index do
        action 'Get rewards'
      end
    end
  end
end