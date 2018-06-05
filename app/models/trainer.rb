class Trainer < ApplicationRecord
  belongs_to :user
  has_many :expertises
  has_many :reviews, through: :bookings
  has_many :bookings
end
