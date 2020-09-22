class User < ApplicationRecord
  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  has_many :created_events, foreign_key: "creator_id", class_name: "Event"
  has_many :attendings
  has_many :attended_events, through: :attendings, source: :event

  scope :attending, -> { where(attending: true) }

  def past_events
    self.attended_events.select { |event| event.date < DateTime.now }
  end

  def upcoming_events
    self.attended_events.select { |event| event.date > DateTime.now }
  end
end
