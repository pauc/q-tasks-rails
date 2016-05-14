require 'rails_helper'

RSpec.describe GoalsController, type: :api do

  describe "GET /:team_id/goals" do
    it "works" do
      with_auth_for user do
        get :index, team_id: team.subdomain
      end

      expect(response).to have_http_status :ok
    end

    it "can include tasks" do
      project = create :project, team: team
      goal    = create :goal, project: project
      create_list :task, 2, goal: goal

      with_auth_for user do
        get :index, team_id: team.subdomain, include: 'tasks'
      end

      expect(json_included.size).to eq 2
      expect(json_included.map { |data| data[:type] })
        .to match_array ['tasks', 'tasks']
    end
  end

  describe "GET /:team_id/goals/:id" do
    let(:goal) {
      create :goal, project: create(:project, team: team)
    }

    it "works" do
      with_auth_for user do
        get :show, team_id: team.subdomain, id: goal.id
      end

      expect(response).to have_http_status :ok
    end

    it "can include tasks" do
      create_list :task, 2, goal: goal

      with_auth_for user do
        get :show, team_id: team.subdomain, id: goal.id,
          include: 'tasks'
      end

      expect(json_included.size).to eq 2
      expect(json_included.map { |data| data[:type] })
        .to match_array ['tasks', 'tasks']
    end
  end

  describe "POST /:team_id/goals" do
    let(:project) { create :project, team: team }

    def perform_request
        with_auth_for user do
          post :create, team_id: team.subdomain, data: {
            type: "goals",
            attributes: {
              name: "A new goal",
              description: "Lorem ipsum blah blah blah..."
            },
            relationships: {
              project: {
                data: {
                  id: project.id,
                  type: "projects"
                }
              }
            }
          }
        end
    end

    it "works" do
      expect { perform_request }.to change { team.goals.count }.by(1)

      expect(json_attributes[:name]).to eq "A new goal"
      expect(json_attributes[:description])
        .to eq "Lorem ipsum blah blah blah..."
      expect(json_relationships[:project][:data][:id])
        .to eq project.id.to_s
    end

    it "creates also a first empty task for the goal and includes it in the response" do
      expect { perform_request }.to change { team.tasks.reload.count }.by(1)

      expect(json_included.size).to eq 1
      expect(json_included.first[:type]).to eq "tasks"

      new_goal_id = json_data[:id]
      new_task_id = json_included.first[:id]
      new_goal    = Goal.find(new_goal_id)
      new_task    = Task.find(new_task_id)

      expect(new_goal.tasks.count).to eq 1
      expect(new_goal.tasks.first).to eq new_task
    end
  end
end
