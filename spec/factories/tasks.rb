FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "Task #{n}" }
    description "MyText"
    goal
  end
end
