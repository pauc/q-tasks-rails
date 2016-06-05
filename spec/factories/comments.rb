FactoryGirl.define do
  factory :comment do
    body_html "MyText"
    body_markdown "MyText"
    task
  end
end
