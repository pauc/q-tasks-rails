class TeamsController < ApplicationController

  def index
    raise NotImplementedError
  end

  def show
    team = Team.find_by! subdomain: params[:id]

    respond_with team
  end
end
