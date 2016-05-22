class AttachmentsController < ApplicationController
  def index
    respond_with default_operation.result
  end

  def show
    attachment = current_team.attachments.find(params[:id])

    respond_with attachment
  end

  def create
    attachment = Attachment.create(attachment_params) do |att|
      att.goal = goal
    end

    respond_with attachment
  end

  private

  def attachment_params
    params.permit(:file)
  end

  def goal
    if goal_id = params[:goal_id].presence
      current_team.goals.find(goal_id)
    end
  end
end
