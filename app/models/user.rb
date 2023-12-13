class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :token_authenticatable

  has_many :games, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :authentication_tokens, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
