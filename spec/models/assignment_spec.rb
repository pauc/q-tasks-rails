require 'rails_helper'

RSpec.describe Assignment, type: :model do
  it "gets deleted when its task is destroyed" do
    assignment = create :assignment

    assignment.task.destroy

    expect(Assignment.exists?(assignment.id)).to be false
  end

  it "gets deleted when its user is destroyed" do
    assignment = create :assignment

    assignment.user.destroy

    expect(Assignment.exists?(assignment.id)).to be false
  end
end
