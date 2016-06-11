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

    dependency_ids = (relationships_data
      .fetch(:dependencies, {})[:data] || [])
      .map { |data| data[:id] }

    TaskDependency.where(dependent_task: result)
      .where.not(dependency_task_id: dependency_ids)
      .destroy_all

    dependency_ids.each do |dependency_id|
      TaskDependency.find_or_create_by(
        dependent_task_id:  result.id,
        dependency_task_id: dependency_id
      )
    end
  end

  def relationships_data
    params.fetch(:data, {})
      .fetch(:relationships)
  end
end
