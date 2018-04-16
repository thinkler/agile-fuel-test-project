class Reward < ApplicationRecord
  extend Enumerize
  include Filterable

  ORDERING_AVAILABLE = %i[status id]
  FILTERING_AVAILABLE = column_names.map(&:to_sym)

  paginates_per 10
  enumerize :status, in: %i[waiting_to_be_approved approved denied sent redeemed completed],
                     default: :waiting_to_be_approved

  belongs_to :user
end
