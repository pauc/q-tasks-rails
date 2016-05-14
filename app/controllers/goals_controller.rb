class GoalsController < ApplicationController
  default_operations_for :index, :show, :create, :update, :destroy


  def create
    included_relations = self.send(:included_relations).to_s.split(",")

    unless included_relations.include?("tasks")
      included_relations << "tasks"
    end

    respond_with default_operation.result, include: included_relations.join(",")
  end

  private

  def allowed_included_relationships
    ['tasks']
  end
end
