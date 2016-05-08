require 'rails_helper'

RSpec.describe TasksController, type: :api do

  describe "GET /:team_id/tasks" do
    it "works" do
      with_auth_for user do
        get :index, team_id: team.subdomain
      end

      expect(response).to have_http_status :ok
    end
  end

  describe "GET /:team_id/tasks/:id" do
    let(:goal) {
      create :goal, project: create(:project, team: team)
    }

    let(:task) { create :task, goal: goal }

    it "works" do
      with_auth_for user do
        get :show, team_id: team.subdomain, id: task.id
      end

      expect(response).to have_http_status :ok
    end
  end

  describe "POST /:team_id/tasks" do
    it "works" do
      project = create :project, team: team
      goal    = create :goal, project: project

      expect {
        with_auth_for user do
          post :create, team_id: team.subdomain, data: {
            type: "tasks",
            attributes: {
              name: "A new task",
              description: "Lorem ipsum blah blah blah..."
            },
            relationships: {
              goal: {
                data: {
                  id: goal.id,
                  type: "goals"
                }
              }
            }
          }
        end
      }.to change {
        Task.count
      }.by(1)


      expect(json_attributes[:name]).to eq "A new task"
      expect(json_attributes[:description])
        .to eq "Lorem ipsum blah blah blah..."
      expect(json_relationships[:goal][:data][:id])
        .to eq goal.id.to_s
    end
  end
end
