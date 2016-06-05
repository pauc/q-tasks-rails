class CommentsController::FetchRecord < Operation

  private

  def perform
    self.result = current_team.comments.find(params[:id])
  end
end
