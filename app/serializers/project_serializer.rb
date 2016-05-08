class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_many :goals
end
