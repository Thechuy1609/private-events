class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, :encrypted_password, presence: true
  has_many :event_attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :event_attendances
   has_many :created_events, class_name: 'Event', foreign_key: 'creator_id'
end
  
