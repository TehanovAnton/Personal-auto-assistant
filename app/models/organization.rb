# frozen_string_literal: true

class Organization < ApplicationRecord
  paginates_per 2

  has_many :cities_organizations, dependent: :destroy
  has_many :cities, through: :cities_organizations

  has_many :services, dependent: :destroy

  has_many :organizations_works, dependent: :destroy
  has_many :works, through: :organizations_works

  has_many :comment, as: :commentable, dependent: :destroy

  belongs_to :service_owner

  validates :address, :email, :name, :phone_number, presence: true, uniqueness: true

  def all_services?
    services.count == Service.count
  end
end
