class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user, null: false, index: true, foreign_key: { on_delete: :cascade }
      t.references :task, null: false, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
