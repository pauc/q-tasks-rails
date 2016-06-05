require 'rails_helper'

RSpec.describe Task, type: :model do
  it "gets destroyed when its goal is destroyed" do
    task = create :task

    task.goal.destroy

    expect(Task.exists?(task.id)).to be false
  end

  describe "#users" do
    it "returns the users assigned to the task" do
      task = create :task

      user_1 = create :user, team: task.goal.project.team
      user_2 = create :user, team: task.goal.project.team

      create :assignment, user: user_1, task: task
      create :assignment, user: user_2, task: task

      expect(task.users.to_a).to match_array [user_1, user_2]
    end
  end

  describe "#description_markdown=(text)" do
    it "parses the markdown and stores the result in :description_html" do
      task = create :task, description_markdown:  "A text with **markdown**"

      expect(task.description_html).to eq "<p>A text with <strong>markdown</strong></p>\n"
    end
  end
end
