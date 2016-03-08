require 'rails_helper'

RSpec.describe Project, type: :model do
  it "gets destroyed when its team is destroyed" do
    project = create :project

    project.team.destroy

    expect(Project.exists?(project.id)).to be false
  end

  it "is not valid without a team" do
    project = build :project, team: nil

    expect(project).not_to be_valid
  end
end
