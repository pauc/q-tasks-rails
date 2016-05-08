class UsersController < ApplicationController

  def index
    respond_with current_team.users
  end

  def show
    respond_with current_team.users.find(params[:id])
  end
end
