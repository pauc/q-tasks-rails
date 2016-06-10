class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description_markdown, :description_html, :position, :done

  belongs_to :goal
  belongs_to :user do
    object.users.first
  end
  has_many :dependencies
  has_many :comments
end
