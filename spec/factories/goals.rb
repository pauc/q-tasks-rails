FactoryGirl.define do
  factory :goal do
    sequence(:name) { |n| "Goal #{n}"}
    description "MyText"
    project
  end
end
