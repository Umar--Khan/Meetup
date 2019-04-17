class Event < ApplicationRecord
    has_many :imgs
    has_many :messages

    has_many :groups
    has_many :users, through: :groups

    has_many :eventtags
    has_many :tags, through: :eventtags
    
    accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :imgs
    accepts_nested_attributes_for :groups

end

