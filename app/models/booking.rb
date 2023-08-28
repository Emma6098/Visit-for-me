class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :visit_form
end
