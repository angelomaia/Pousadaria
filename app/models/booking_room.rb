class BookingRoom < ApplicationRecord
  belongs_to :inn_room
  belongs_to :group_booking
end
