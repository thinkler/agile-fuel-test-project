module RewardsHelpers
  def sortable(column)
    title ||= column.titleize

    direction = params[:order] && params[:order] == column ? '-' : ''
    order = direction + column

    link_to title, request.params.merge(order: order)
  end

  def apply_status_filter(status)
    link_to format_status(status), request.params.merge(status: status, page: 1)
  end

  def format_status(status)
    status.tr('_', ' ').capitalize
  end
end
