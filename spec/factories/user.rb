FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "some#{n}@mail.com" }
    name 'Foo Name'
    password 'foopass'
  end
end
