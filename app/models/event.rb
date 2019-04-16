class Event < ApplicationRecord

    has_many :tags
    has_many :imgs
    has_many :messages
    accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :imgs
end

