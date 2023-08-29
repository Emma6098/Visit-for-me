class Room < ApplicationRecord
  belongs_to :visit_form
  has_many_attached :photos
end
