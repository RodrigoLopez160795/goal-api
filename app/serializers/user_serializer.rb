class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :token, :list_id
end
