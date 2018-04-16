FactoryBot.define do
  factory :reward do
    status { Reward.status.values.sample }
    user { create(:user) }
  end
end
