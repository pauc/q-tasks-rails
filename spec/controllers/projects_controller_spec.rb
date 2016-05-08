require 'rails_helper'

RSpec.describe ProjectsController, type: :api do

  describe "GET /:team_id/projects" do
    it "works" do
      with_auth_for user do
        get :index, team_id: team.subdomain
      end

      expect(response).to have_http_status :ok
    end

    it "can include goals" do
      project = create :project, team: team
      create_list :goal, 2, project: project

      with_auth_for user do
        get :index, team_id: team.subdomain, include: 'goals'
      end

      expect(json_included.size).to eq 2
      expect(json_included.map { |data| data[:type] })
        .to match_array ['goals', 'goals']
    end
  end

  describe "GET /:team_id/projects/:id" do
    let(:project) { create :project, team: team }

    it "works" do
      with_auth_for user do
        get :show, team_id: team.subdomain, id: project.id
      end

      expect(response).to have_http_status :ok
    end

    it "can include goals" do
      create_list :goal, 2, project: project

      with_auth_for user do
        get :show, team_id: team.subdomain, id: project.id,
          include: 'goals'
      end

      expect(json_included.size).to eq 2
      expect(json_included.map { |data| data[:type] })
        .to match_array ['goals', 'goals']
    end
  end

  describe "POST /:team_id/projects" do
    it "works" do
      expect {
        with_auth_for user do
          post :create, team_id: team.subdomain, data: {
            attributes: {
              name: "A new project",
              description: "Lorem ipsum blah blah blah..."
            }
          }
        end
      }.to change {
        team.projects.count
      }.by(1)

      expect(json_attributes[:name]).to eq "A new project"
      expect(json_attributes[:description])
        .to eq "Lorem ipsum blah blah blah..."
    end
  end
end
