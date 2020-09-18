class Event < ApplicationRecord
    validates :title, presence: true, length: { maximum: 35 }
    validates :body, presence: true, length: { maximum: 100 }
    validate :future_event

    belongs_to :creator, class_name: "User"
    has_many :attendings
    has_many :attendees, through: :attendings, source: :user

    def future_event
        errors.add(:date, " Can't be in the past!") if date < Time.now
    end
end
