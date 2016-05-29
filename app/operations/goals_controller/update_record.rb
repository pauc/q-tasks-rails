class GoalsController::UpdateRecord < Operation

  private

  def perform
    self.result = goal = current_team.goals.find(params[:id])

    p goal_params
    goal.update(goal_params)
  end

  def goal_params
    params.require(:data).permit(attributes: :name)
  end
end
