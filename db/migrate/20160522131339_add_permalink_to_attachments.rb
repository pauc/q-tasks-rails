class AddPermalinkToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :permalink, :string, null: false

    add_index :attachments, :permalink, unique: true
  end
end
