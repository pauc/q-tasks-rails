FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    description_markdown "MyText"
    goal
  end
end
