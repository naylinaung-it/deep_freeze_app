# require 'deep_freeze'
class Post < ApplicationRecord
    include DeepFreeze

    # Array allowed post title
    @@allowed_titles = ["Mr.", "Mrs.", "Ms.", "Dr.", "Prof." ]

    # validations
    validate :title_is_allowed

    # Constructor
    def initialize(attribures= { })
        super
        deep_freeze(@@allowed_titles)
    end


    # custom validation
    def title_is_allowed
        unless @@allowed_titles.include?(title)
            errors.add(:title, "#{title} is not included in the list #{@@allowed_titles}" )
        end
    end
end
