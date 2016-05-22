class AddIsImageToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :is_image, :boolean
  end
end
