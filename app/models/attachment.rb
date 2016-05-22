class Attachment < ActiveRecord::Base
  belongs_to :goal

  mount_uploader :file, BasicUploader

  before_validation(on: :create) do
    begin
      self.permalink = SecureRandom.hex
    end while self.class.exists? permalink: self.permalink

    true
  end

  before_save do
    self.is_image = file.is_image?

    true
  end
end
