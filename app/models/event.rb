class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :attendings
    has_many :attendees, through: :attendings, source: :user
end
