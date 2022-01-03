class Organization < ApplicationRecord
  has_many :cities_organizations, dependent: :destroy
  has_many :cities, through: :cities_organizations

  validates :adress, :email, :name, :phone_number, presence: true, uniqueness: true
end
