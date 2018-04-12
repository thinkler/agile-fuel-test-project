module ApplicationHelper
  def sortable(column)
    title ||= column.titleize
    old_order = params[:order] || ''
    direction = '-'

    direction = '' if old_order[0] == '-' || !old_order.include?(column)

    link_to title, request.params.merge(order: direction + column)
  end

  def apply_status_filter(status)
    link_to format_status(status), request.params.merge(filters: { status: status }, page: 1)
  end

  def format_status(status)
    status.tr('_', ' ').capitalize
  end

end
