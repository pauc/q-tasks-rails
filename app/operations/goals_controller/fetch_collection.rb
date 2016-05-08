class GoalsController::FetchCollection < Operation

  def perform
    self.result = current_team.goals
  end
end
