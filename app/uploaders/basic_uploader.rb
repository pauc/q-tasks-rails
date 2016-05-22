class BasicUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick

  process :set_content_type

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/attachment_files/#{model.permalink}"
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  version :thumb, if: :is_image? do
    process :resize_to_fit => [100, 100]
  end

  version :preview, if: :is_image? do
    process resize_to_fit: [400, 400]
  end

  def is_image?(_ = nil)
    self.content_type.include? "image"
  end

  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_ID'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :region                 => 'eu-west-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.fog_public     = false
    config.cache_dir = "system/uploads/tmp"
  end
end
