FactoryBot.define do
  factory :project do
    name { "JavaScript" }
    description { "my first project"}
    user
    github { "this is link to github" }
    start_date { Date.today }
  end
end
