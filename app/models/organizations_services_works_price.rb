# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations_services_works_prices
#
#  id              :bigint           not null, primary key
#  organization_id :integer          not null
#  service_id      :integer          not null
#  service_work_id :integer          not null
#  price           :integer          default(1), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class OrganizationsServicesWorksPrice < ApplicationRecord
  belongs_to :organization
  belongs_to :service
  belongs_to :service_work

  has_many :orders, dependent: :destroy

  delegate :name, to: :service
  delegate :title, to: :service_work

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
