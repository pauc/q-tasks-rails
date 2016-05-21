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
    relationships_data = params.fetch(:data, {})
      .fetch(:relationships, {})

    if relationships_data.key?(:user) && (relationships_data[:user].blank? || relationships_data[:user][:id].blank?)
      result.assignments.destroy_all

      return
    end

    if user_id = user_data[:id].presence and current_team.user_ids.include?(user_id.to_i)
      result.user_ids = [user_id]
    end
  end
end
