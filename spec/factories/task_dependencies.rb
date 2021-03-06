FactoryGirl.define do
  factory :task_dependency do
    association :dependent_task, factory: :task
    association :dependency_task, factory: :task

    after(:build) do |dependency|
      dependency.dependency_task.goal =
        dependency.dependent_task.goal
    end
  end
end
