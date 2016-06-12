class TasksController < ApplicationController
  default_operations_for :index, :show, :create, :update, :destroy
end
