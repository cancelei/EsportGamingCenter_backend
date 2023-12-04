class Game < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
