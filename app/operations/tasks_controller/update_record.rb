class TasksController::UpdateRecord < Operation

  private

  def perform
    self.result = task = current_team.tasks.find(params[:id])

    assign_user

    task.update(task_params)
  end

  def task_params
    params.require(:data).permit(
      attributes: [
        :name,
        :description_markdown,
        :position
      ]
    )
  end

  def assign_user
    user_data = params.fetch(:data, {})
      .fetch(:relationships, {})
      .fetch(:user, {})
      .fetch(:data, {})

    if user_data.key?(:id) && user_data[:id].blank?
      task.assignments.destroy_all

      return
    end

    if user_id = user_data[:id].presence and current_team.user_ids.include?(user_id.to_i)
      result.user_ids = [user_id]
    end
  end
end
