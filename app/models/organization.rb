# frozen_string_literal: true

# == Schema Information
#
# Table name: organizations
#
#  id               :bigint           not null, primary key
#  email            :string           not null
#  phone_number     :string           not null
#  address          :string           not null
#  name             :string           not null
#  service_owner_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
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
