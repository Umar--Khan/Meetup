class Event < ApplicationRecord

    has_many :tags
    has_many :imgs
    has_many :messages
    
end

