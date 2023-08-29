class VisitForm < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many :criteres, dependent: :destroy
  accepts_nested_attributes_for :criteres, reject_if: :all_blank, allow_destroy: true
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  validates :title, presence: true, length: { maximum: 50 }
  validates :address, presence: true
  validates :url, presence: true
  validates :rooms_number, presence: true
  # validates :criteres, presence: true

end
