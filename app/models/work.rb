# frozen_string_literal: true

class Work < ApplicationRecord
  has_many :organizations_works, dependent: :destroy
  has_many :organizations, through: :organizations_works

  belongs_to :category

  validates :title, presence: true, uniqueness: true

  def price_in_organization(organization_id)
    organizations_works.find_by(organization_id: organization_id, work_id: id).price
  end
end
