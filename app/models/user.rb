class User < ApplicationRecord
    has_many :ratings
    has_many :events
    has_many :messages
    has_many :tags
end
