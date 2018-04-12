class Reward < ApplicationRecord
  extend Enumerize
  include Filterable

  ORDERING_AVAILABLE = %w[status id]
  FILTERING_AVAILABLE = column_names

  paginates_per 20
  enumerize :status, in: %i[waiting_to_be_approved approved denied sent redeemed completed],
                     default: :waiting_to_be_approved

  belongs_to :user
end
