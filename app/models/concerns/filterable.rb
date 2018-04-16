module Filterable
  extend ActiveSupport::Concern

  class_methods do
    def filter(params)
      order = params.delete(:order) || ''
      filter_by(params).order ordering(order)
    end

    private

    def filter_by(params)
      where(params)
    end

    def ordering(param)
      return '' if param.empty?
      param[0] == '-' ? { param[1..-1] => 'desc' } : { param => 'asc' }
    end
  end
end
