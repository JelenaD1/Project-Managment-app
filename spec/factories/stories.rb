FactoryBot.define do
  factory :story do
    name { "JavaScript" }
    description { "my first project"}
    user
    start_date { Date.today }
  end
end
