class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :bio, :avatar, :online
end
