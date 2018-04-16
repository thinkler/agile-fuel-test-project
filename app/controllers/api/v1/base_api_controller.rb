module Api
  module V1
    class BaseApiController < ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken

      def render_success(resource)
        meta = meta(resource) if resource.try(:total_count)
        render json: resource, meta: meta, adapter: :json, status: :ok
      end

      def render_errors(errors, status)
        render json: { errors: errors }, status: status
      end

      private

      def meta(resource)
        {
          total_count: resource.total_count,
          per_page: resource.limit_value,
          total_pages: resource.total_pages,
          current_pages: resource.current_page
        }
      end
    end
  end
end
