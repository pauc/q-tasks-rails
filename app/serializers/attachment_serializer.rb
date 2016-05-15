class AttachmentSerializer < ActiveModel::Serializer
  attributes :id

  attribute :file_url do
    object.file.try(:url)
  end

  belongs_to :goal
end
