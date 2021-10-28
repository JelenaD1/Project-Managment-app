FactoryBot.define do
  factory :user do
    name { "Steve" }
    sequence(:email, 1) { |n| "steve#{n}@gmail.com"}
    password { "123456789"}
  end
end
