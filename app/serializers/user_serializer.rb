class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :address, :bio, :requests, :isSitter, :claims, :owners, :sitters, :password

end
