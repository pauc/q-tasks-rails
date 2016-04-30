class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json

  def current_team
    @current_team ||= Team.find_by(subdomain: params[:team_id])
  end
end
