class GoalsController::FetchRecord < Operation

  private

  def perform
    self.result = current_team.goals.find(params[:id])
  end
end
