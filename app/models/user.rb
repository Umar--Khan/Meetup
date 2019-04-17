class User < ApplicationRecord
    has_many :ratings
    has_many :groups
    has_many :tags
    has_many :events, through: :groups
    has_secure_password
    accepts_nested_attributes_for :tags
    validates :name, presence: :true, uniqueness: :true
end
