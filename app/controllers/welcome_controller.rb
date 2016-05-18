class WelcomeController < ApplicationController
  respond_to :html

  skip_before_action :doorkeeper_authorize!

  def index
    html = Redis.current.get 'q-tasks:index:current-content'

    render html: html.html_safe
  end
end
