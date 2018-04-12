FactoryBot.define do
  factory :reward do
    status { Reward.status.values.sample }
    user_id 1
  end
end
