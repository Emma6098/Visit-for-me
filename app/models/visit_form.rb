class VisitForm < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :criteres, dependent: :destroy
  has_many_attached :photos
  accepts_nested_attributes_for :criteres
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :url, presence: true
  validates :rooms_number, presence: true

end
