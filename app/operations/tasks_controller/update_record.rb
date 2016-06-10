class TasksController::UpdateRecord < Operation

  private

  def perform
    self.result = task = current_team.tasks.find(params[:id])

    task.update(task_params)

    assign_user
    assign_dependencies
  end

  def task_params
    params.require(:data).permit(
      attributes: [
        :name,
        :description_markdown,
        :position,
        :done
      ]
    )
  end

  def assign_user
    return unless relationships_data.key?(:user)

    if (relationships_data[:user].blank? || relationships_data[:user][:data].blank?)
      result.assignments.destroy_all

      return
    end

    if user_id = relationships_data[:user][:data][:id].presence and current_team.user_ids.include?(user_id.to_i)
      result.user_ids = [user_id]
    end
  end

  def assign_dependencies
    return unless relationships_data.key?(:dependencies)

    dependencies_data = relationships_data[:dependencies]

    if dependencies_data.blank? || dependencies_data[:data].blank?
      result.dependencies = []

      return
    end

    dependency_ids = dependencies_data[:data].map { |data| data[:id] }

    result.dependency_ids = dependency_ids
  end

  def relationships_data
    params.fetch(:data, {})
      .fetch(:relationships)
  end
end
