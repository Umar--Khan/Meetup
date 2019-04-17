class User < ApplicationRecord
    has_many :ratings

    has_many :groups
    has_many :events, through: :groups


    has_many :usertags, dependent: :destroy
    has_many :tags, through: :usertags

    has_secure_password
    accepts_nested_attributes_for :tags
    validates :name, presence: :true, uniqueness: :true

    def autosave_associated_records_for_tags
        if tag_exists = Tag.find_or_create_by(main_tag: tags[0].main_tag)
            Usertag.find_or_create_by(
                tag_id: tag_exists.id,
                user_id: self.id)
        end
    end

end
