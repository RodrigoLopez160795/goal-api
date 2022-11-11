class UserSerializer < ActiveModel::Serializer
  attributes :username, :email, :token, :list_id
end
