require 'rails_helper'

RSpec.describe User, type: :model do
  it "gets destroyed when its team is destroyed" do
    user = create :user

    user.team.destroy

    expect(User.exists?(user.id)).to be false
  end

  describe "#tasks" do
    it "returns the tasks assigned to the user" do
      task_1 = create :task
      task_2 = create :task, goal: task_1.goal

      user = create :user

      user.assignments.create task: task_1
      user.assignments.create task: task_2

      expect(user.tasks.to_a).to match_array [task_1, task_2]
    end
  end
end
