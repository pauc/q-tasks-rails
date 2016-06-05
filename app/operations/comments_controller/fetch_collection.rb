class CommentsController::FetchCollection < Operation
  include Filtering

  private

  def perform
    self.result = current_team.comments

    apply_filters
  end

  def available_filters
    [:id]
  end
end
