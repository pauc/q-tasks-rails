class GoalsController < ApplicationController
  default_operations_for :index, :show, :create, :update, :destroy

  private

  def allowed_included_relationships
    ['tasks']
  end
end
