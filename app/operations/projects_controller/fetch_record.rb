class ProjectsController::FetchRecord < Operation

  private

  def perform
    self.result = current_team.projects.find(params[:id])
  end
end
