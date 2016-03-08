require 'rails_helper'

RSpec.describe Team, type: :model do
  it "is valid" do
    team = create :team

    expect(team).to be_valid
  end

  it "is invalid with a repeated subdomain" do
    team_1 = create :team
    team_2 = build :team, subdomain: team_1.subdomain

    expect(team_2).not_to be_valid
  end
end
