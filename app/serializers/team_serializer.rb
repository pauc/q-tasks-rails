class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :subdomain

  def id
    object.subdomain
  end
end
