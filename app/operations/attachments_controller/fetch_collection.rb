class AttachmentsController::FetchCollection < Operation
  include Filtering

  AVAILABLE_FILTERS = ["id"]

  private

  def perform
    self.result = current_team.attachments

    apply_filters
  end

  def available_filters
    AVAILABLE_FILTERS
  end

  def filter_by_id(value)
    self.result = result.where(id: value.split(","))
  end
end
