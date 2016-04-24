class TaskDependency < ActiveRecord::Base
  belongs_to :dependent_task, class_name: "Task",
    inverse_of: :task_dependencies
  belongs_to :dependency_task, class_name: "Task",
    inverse_of: :inverse_task_dependency

  validates :dependent_task, presence: true
  validates :dependency_task, presence: true
end
