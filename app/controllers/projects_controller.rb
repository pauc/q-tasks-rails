class ProjectsController < ApplicationController
  default_operations_for :index, :show, :create

  private

  def allowed_included_relationships
    ['goals']
  end
end
