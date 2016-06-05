class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body_html
      t.text :body_markdown
      t.belongs_to :task, null: false, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
