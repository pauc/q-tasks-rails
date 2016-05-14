class AllowNullOnTaskNames < ActiveRecord::Migration
  def up
    change_column :tasks, :name, :string, null: true
  end

  def down
    change_column :tasks, :name, :string, null: false
  end
end
