class RewardSerializer < ActiveModel::Serializer
  attributes :id, :status, :created_at
  has_one :user

  def created_at
    object.created_at.strftime('%m/%d/%Y at %I:%M%p')
  end

  def status
    object.status.titleize
  end

  def user
    object.user.email
  end
end
