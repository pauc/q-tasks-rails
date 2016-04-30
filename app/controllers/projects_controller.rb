class ProjectsController < ApplicationController

  def index
    respond_with current_team.projects
  end
end
