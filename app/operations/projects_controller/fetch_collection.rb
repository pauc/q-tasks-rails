class ProjectsController::FetchCollection < Operation

  private

  def perform
    self.result = current_team.projects
  end
end
