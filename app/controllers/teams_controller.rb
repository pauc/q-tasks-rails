class TeamsController < ApplicationController
  skip_before_action :doorkeeper_authorize!

  def index
    raise NotImplementedError
  end

  def show
    team = Team.find_by! subdomain: params[:id]

    respond_with team
  end
end
