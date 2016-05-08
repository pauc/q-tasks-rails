class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.references :goal, index: true, foreign_key: { on_delete: :cascade },
        null: false

      t.timestamps null: false
    end

    add_index :tasks, [:name, :goal_id], unique: :true
  end
end
