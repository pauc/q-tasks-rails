class GoalsController::CreateRecord < Operation

  private

  def perform
    self.result = goal = Goal.new(goal_params)

    goal.project = project

    goal.save
  end

  def goal_params
    params.require(:data).permit(
      attributes: [
        :name,
        :description
      ]
    )
  end

  def project
    project_id = params.fetch(:data, {})
      .fetch(:relationships, {})
      .fetch(:project, {})
      .fetch(:data, {})[:id]

    current_team.projects.find_by(id: project_id)
  end
end
