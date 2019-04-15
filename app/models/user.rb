class User < ApplicationRecord
    has_many :ratings
    has_many :groups
    has_many :tags
    has_many :events, through: :groups
end
