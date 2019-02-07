class RequestSerializer < ActiveModel::Serializer
  attributes :id, :owner_id, :sitter_id, :owner, :sitter, :status, :start_date, :end_date, :message
end
