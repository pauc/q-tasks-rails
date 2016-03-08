require 'rails_helper'

RSpec.describe Job, type: :model do
  it "gets destroyed when its project is destroyed" do
    job = create :job

    job.project.destroy

    expect(Job.exists?(job.id)).to be false
  end
end
