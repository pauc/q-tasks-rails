require 'rails_helper'

RSpec.describe TaskDependency, type: :model do
  it "works" do
    t1 = create :task
    t2 = create :task, goal: t1.goal

    t2.dependencies << t1

    expect(t1.dependent_tasks).to include t2
  end

  it "gets destroyed when a related task is destroyed" do
    dependency = create :task_dependency

    expect(TaskDependency.exists? dependency.id).to be true

    expect {
      dependency.dependent_task.destroy
    }.to change {
      TaskDependency.count
    }.by -1

    expect(TaskDependency.exists? dependency.id).to be false
  end
end
