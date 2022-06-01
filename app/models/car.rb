# frozen_string_literal: true

# == Schema Information
#
# Table name: cars
#
#  id                :bigint           not null, primary key
#  user_id           :integer
#  model             :string           default("a12"), not null
#  year_production   :integer          default(2000), not null
#  engine_volume     :integer          default(1), not null
#  mileage           :integer          default(0), not null
#  body_type         :string           default("sedan"), not null
#  maker             :string           default("bmw"), not null
#  vin               :string           default("123asdfaase123"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  fuel_type         :integer          default("electricity"), not null
#  transmission_type :integer          default("mechanic"), not null
#
class Car < ApplicationRecord
  paginates_per 2

  has_one_attached :photo

  has_many :cars_parts, dependent: :destroy
  has_many :parts, through: :cars_parts

  has_many :consumables

  belongs_to :user

  enum fuel_type: { electricity: 0, gas: 1, petrol: 2 }
  enum transmission_type: { mechanic: 0, automatic: 1 }

  validates :model, :year_production, :engine_volume,
            :mileage, :body_type, :fuel_type,
            :transmission_type, :maker, :vin,
            presence: true

  validates :vin, uniqueness: true
  validates :engine_volume, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 3.5 }
  validates :fuel_type, inclusion: { in: Car.fuel_types.keys }
  validates :transmission_type, inclusion: { in: Car.transmission_types.keys }

  def all_parts?
    parts.size == Part.count
  end

  def car_name
    "#{maker}, #{model}, #{vin}"
  end
end
