class Img < ApplicationRecord
    belongs_to :event

    validates :url, uniqueness: true
end
