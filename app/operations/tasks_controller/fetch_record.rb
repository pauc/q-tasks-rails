class TasksController::FetchRecord < Operation

  private

  def perform
    self.result = current_team.tasks.find(params[:id])
  end
end
