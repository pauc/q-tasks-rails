class TasksController::UpdateRecord < Operation

  private

  def perform
    self.result = task = current_team.tasks.find(params[:id])

    task.update(task_params)
  end

  def task_params
    params.require(:data).permit(
      attributes: [
        :name,
        :description,
        :position
      ]
    )
  end
end
