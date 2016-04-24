FactoryGirl.define do
  factory :task_dependency do
    association :dependent_task, factory: :task
    association :dependency_task, factory: :task

    after(:build) do |dependency|
      dependency.dependency_task.job =
        dependency.dependent_task.job
    end
  end
end
