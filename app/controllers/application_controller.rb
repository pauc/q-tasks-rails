require 'api_responder'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :doorkeeper_authorize!
  before_action :authenticate_user_from_token

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

  def authenticate_user_from_token
    return unless doorkeeper_token.try :resource_owner_id

    user = User.find(doorkeeper_token.resource_owner_id)
    sign_in user, store: false if user
  end
end
