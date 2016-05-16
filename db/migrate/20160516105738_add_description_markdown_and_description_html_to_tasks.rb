class AddDescriptionMarkdownAndDescriptionHtmlToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :description_markdown, :text
    add_column :tasks, :description_html, :text

    remove_column :tasks, :description, :text
  end
end
