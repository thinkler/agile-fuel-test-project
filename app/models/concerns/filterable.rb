module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter(params)
      filter_by(params[:filters] || []).order ordering(params[:order] || [])
    end

    def filter_by(filtering_params)
      results = unscoped
      filtering_params.each do |key, val|
        next unless self::FILTERING_AVAILABLE.include?(key.to_s) && val.present?
        results = results.where(key => val)
      end
      results
    end

    def ordering(ordering_param)
      result = ordering_param[0] == '-' ? { ordering_param[1..-1] => 'desc' } : { ordering_param => 'asc' }
      return nil unless self::ORDERING_AVAILABLE.include?(result.keys[0])
      result
    end
  end
end
