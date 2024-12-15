class Event < ApplicationRecord
  validates :date_time, :title, presence: true
  validates :description, presence: true
  validates :description, length: { minimum: 5}
  validates :title, length: { minimum: 5}
  belongs_to :creator, class_name: "User", foreign_key: "creator_id"
  has_many :event_attendances, foreign_key: "attended_event_id"
  has_many :attendees, through: :event_attendances, class_name: "User"
  scope :past, -> { where('date_time < ?', Date.today).order(date_time: :desc) }
  scope :future, -> { where('date_time > ?', Date.today).order(:date_time) }
end
