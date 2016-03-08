class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.text :description
      t.references :job, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end

    add_index :tasks, [:name, :job_id], unique: :true
  end
end
