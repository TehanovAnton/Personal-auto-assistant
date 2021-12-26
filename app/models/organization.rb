class Organization < ApplicationRecord
  has_many :cities_organizations
  has_many :cities, through: :cities_organizations

  validates :adress, :email, :name, :phone_number, presence: true
  validates :adress, :email, :name, :phone_number, uniqueness: true
end
