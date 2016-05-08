class TasksController::FetchCollection < Operation

  private

  def perform
    self.result = current_team.tasks
  end
end
