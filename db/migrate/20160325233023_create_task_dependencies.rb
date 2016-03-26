class CreateTaskDependencies < ActiveRecord::Migration
  def change
    create_table :task_dependencies do |t|
      t.integer :dependent_task_id, index: true, null: false
      t.integer :dependency_task_id, index: true, null: false

      t.timestamps null: false
    end

    add_foreign_key :task_dependencies, :tasks, column: :dependent_task_id, on_delete: :cascade
    add_foreign_key :task_dependencies, :tasks, column: :dependency_task_id, on_delete: :cascade
  end
end
