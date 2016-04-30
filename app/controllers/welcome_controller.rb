class WelcomeController < ApplicationController
  respond_to :html

  def index
    html = Redis.current.get 'q-tasks:index:current-content'

    render html: html.html_safe
  end
end
