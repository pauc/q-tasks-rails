class AddNotNullConstraintToFileOnAttachments < ActiveRecord::Migration
  def change
    change_column_null(:attachments, :file, false)
  end
end
