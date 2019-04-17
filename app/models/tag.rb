class Tag < ApplicationRecord

    has_many :usertags
    has_many :users, through: :usertags

    has_many :eventtags
    has_many :users, through: :usertags
end

