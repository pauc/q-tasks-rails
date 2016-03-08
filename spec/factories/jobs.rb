FactoryGirl.define do
  factory :job do
    sequence(:name) { |n| "Job #{n}"}
    description "MyText"
    project
  end
end
