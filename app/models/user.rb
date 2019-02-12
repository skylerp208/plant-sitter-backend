class User < ApplicationRecord

  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}

  has_many :requests, foreign_key: "owner_id"
  has_many :claims, class_name: :Request, foreign_key: "sitter_id"

  has_many :owners, :through => :claims, :source => 'owner'
  has_many :sitters, :through => :requests, :source => 'sitter'

  has_one_attached :profile_photo
  has_many_attached :plant_photos
end
