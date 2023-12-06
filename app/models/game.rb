class Game < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
end
