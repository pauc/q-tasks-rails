class GoalsController::DestroyRecord < Operation

  private

  def perform
    self.result = goal = current_team.goals.find(params[:id])

    goal.destroy
  end
end
