class RemoveUniqueIndexOnNameAndGoalIdOnTasks < ActiveRecord::Migration
  def change
    remove_index :tasks, column: [:name, :goal_id], unique: true
  end
end
