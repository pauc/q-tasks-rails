class WelcomeController < ApplicationController
  respond_to :html

  skip_before_action :doorkeeper_authorize!

  def index
    revision_key = params[:frontend_version] || "current-content"

    html = Redis.current.get "q-tasks:index:#{revision_key}"

    render html: html.html_safe
  end
end
