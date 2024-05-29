class GroupBooking < ApplicationRecord
  belongs_to :inn
  has_many :booking_rooms
end
