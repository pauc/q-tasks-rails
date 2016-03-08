class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name, null: false
      t.text :description
      t.references :project, null: false, index: true,
        foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end

    add_index :jobs, [:name, :project_id], unique: true
  end
end
