require 'rails_helper'

RSpec.describe Goal, type: :model do
  it "gets destroyed when its project is destroyed" do
    goal = create :goal

    goal.project.destroy

    expect(Goal.exists?(goal.id)).to be false
  end
end
