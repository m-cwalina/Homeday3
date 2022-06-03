class Seller < ApplicationRecord
  has_many :appointments, dependent: :destroy
  validates :name, presence: true
  validates :phone, presence: true
end
