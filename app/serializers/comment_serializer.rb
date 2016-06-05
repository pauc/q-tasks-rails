class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body_markdown, :body_html, :created_at

  belongs_to :task
end
