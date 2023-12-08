class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
