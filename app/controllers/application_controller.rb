require 'api_responder'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  include HasDefaultOperations

  respond_to :json
  self.responder = ApiResponder

  def current_team
    @current_team ||= Team.find_by(subdomain: params[:team_id])
  end

  private

  def included_relations
    return unless params[:include]

    (allowed_included_relationships & requested_includes).join(',')
  end

  def allowed_included_relationships
    []
  end

  def requested_includes
    return unless params[:include]

    @requested_includes ||= params[:include].to_s.split(',').map(&:strip)
  end
end
