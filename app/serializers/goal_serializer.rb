class GoalSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  belongs_to :project
  has_many   :tasks
end
