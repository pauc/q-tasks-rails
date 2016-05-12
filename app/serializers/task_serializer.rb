class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :position

  belongs_to :goal
end
