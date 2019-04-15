class Event < ApplicationRecord

    has_many :users
    has_many :tags
    has_many :imgs
    has_many :messages
    has_many :hookups
    
end

