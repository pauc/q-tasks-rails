class AddDoneToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :done, :boolean, default: false, null: false
  end
end
