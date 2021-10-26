FactoryBot.define do
  factory :task do
    title { "JavaScript" }
    description { "my first project"}
    project
    category
    status {"complete"}
  end
end
