class Tag < ApplicationRecord

    has_many :users
    has_many :events
    
end

