class RequestSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :sitter_id
end
