FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "some#{n}@mail.com" }
    password 'foopass'
  end
end