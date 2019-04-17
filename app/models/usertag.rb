class Usertag < ApplicationRecord
    belongs_to :user
    belongs_to :tag
end
