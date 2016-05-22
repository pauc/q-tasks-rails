class AttachmentSerializer < ActiveModel::Serializer
  attributes :id, :is_image

  attribute :file_url do
    object.file.try(:url)
  end

  attribute :thumb_url do
    if object.is_image?
      object.file.thumb.url
    end
  end

  attribute :preview_url do
    if object.file.is_image?
      object.file.preview.url
    end
  end

  belongs_to :goal
end
