class InnRoom < ApplicationRecord
  belongs_to :inn
  has_one_attached :photo
  has_many :booking_rooms

  validates :name, presence: true
  validates :size, :guest_limit, numericality: { greater_than: 0 }
end
