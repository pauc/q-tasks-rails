class CommentsController::CreateRecord < Operation

  private

  def perform
    self.result = comment = Comment.new comment_attributes

    comment.task = task
    comment.user = current_user

    comment.save
  end

  def comment_attributes
    params.require(:data)
      .permit(attributes: :body_markdown)
  end

  def task
    task_id = params.require(:data)
      .fetch(:relationships, {})
      .fetch(:task, {})
      .fetch(:data, {})[:id]

    current_team.tasks.find(task_id)
  end
end
