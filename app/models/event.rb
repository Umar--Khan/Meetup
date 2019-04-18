class Event < ApplicationRecord
    has_many :places
    has_many :messages

    has_many :groups
    has_many :users, through: :groups

    has_many :eventtags
    has_many :tags, through: :eventtags
    
    accepts_nested_attributes_for :tags
    accepts_nested_attributes_for :groups
    accepts_nested_attributes_for :places
    accepts_nested_attributes_for :messages


    # def autosave_associated_records_for_tags
    #     if tag_exists = Tag.find_or_create_by(main_tag: tags[0].main_tag)
    #         Usertag.find_or_create_by(
    #             tag_id: tag_exists.id,
    #             user_id: self.id)
    #     end
    # end
end

