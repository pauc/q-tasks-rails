class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description_markdown, :description_html, :position

  belongs_to :goal
  belongs_to :user do
    object.users.first
  end
  has_many :dependencies
end
