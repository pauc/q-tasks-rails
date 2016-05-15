class Attachment < ActiveRecord::Base
  belongs_to :goal

  mount_uploader :file, BasicUploader
end
