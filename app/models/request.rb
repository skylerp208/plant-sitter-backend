class Request < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  belongs_to :sitter, class_name: "User" , optional: true
end
