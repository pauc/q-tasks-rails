class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :position

  belongs_to :goal
  belongs_to :user do
    object.users.first
  end
end
