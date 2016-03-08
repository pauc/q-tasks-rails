require 'rails_helper'

RSpec.describe Task, type: :model do
  it "gets destroyed when its job is destroyed" do
    task = create :task

    task.job.destroy

    expect(Task.exists?(task.id)).to be false
  end

  describe "#users" do
    it "returns the users assigned to the task" do
      task = create :task

      user_1 = create :user, team: task.job.project.team
      user_2 = create :user, team: task.job.project.team

      create :assignment, user: user_1, task: task
      create :assignment, user: user_2, task: task

      expect(task.users.to_a).to match_array [user_1, user_2]
    end
  end
end
