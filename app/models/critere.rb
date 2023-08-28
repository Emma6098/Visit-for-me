class Critere < ApplicationRecord
  belongs_to :visit_form
  has_many :answers
end
