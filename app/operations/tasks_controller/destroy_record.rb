class TasksController::DestroyRecord < Operation

  private

  def perform
    self.result = task = current_team.tasks.find(params[:id])

    task.destroy
  end
end

