class ProjectsController::CreateRecord < Operation

  private

  def perform
    self.result = current_team.projects.create(project_params)
  end

  def project_params
    params.require(:data).permit(
      attributes: [
        :name,
        :description
      ]
    )
  end
end
