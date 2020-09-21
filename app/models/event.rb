class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 35 }
  validates :body, presence: true, length: { maximum: 155 }
  validate :future_event

  belongs_to :creator, class_name: "User"
  has_many :attendings
  has_many :attendees, through: :attendings, source: :user

  def future_event
    errors.add(:date, "Can not be set to the past.") if date < Time.now
  end

  scope :attended, -> { where(attended: true) }
  scope :past, -> { where("date <= ?", DateTime.now) }
  scope :upcoming, -> { where("date > ?", DateTime.now)}
end
