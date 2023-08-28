class Answer < ApplicationRecord
  belongs_to :critere
  has_many_attached :photos

  validates :content, presence: true
  validates :photos, presence: true
end
