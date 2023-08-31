class Critere < ApplicationRecord
  belongs_to :visit_form
  has_many :answers
  has_many_attached :photos
end
