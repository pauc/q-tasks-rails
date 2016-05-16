class TasksController::CreateRecord < Operation

  private

  def perform
    self.result = task = Task.new(task_params)

    task.goal = goal

    task.save
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

  def goal
    goal_id = params.fetch(:data, {})
      .fetch(:relationships, {})
      .fetch(:goal, {})
      .fetch(:data, {})[:id]

    current_team.goals.find_by(id: goal_id)
  end
end
