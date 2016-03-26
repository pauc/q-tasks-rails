class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.references :team, index: true, foreign_key: { on_delete: :cascade },
        null: false

      t.timestamps null: false
    end

    add_index :projects, [:name, :team_id], unique: true
  end
end
