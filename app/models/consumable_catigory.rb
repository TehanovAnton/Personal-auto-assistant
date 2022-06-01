# frozen_string_literal: true

# == Schema Information
#
# Table name: consumables
#
#  id         :bigint           not null, primary key
#  name       :integer          default("fuel"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ConsumableCatigory < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :cars, through: :car_consumable_values

  enum name: { fuel: 0, coolant: 1, 'brake fluid': 2 }

  validates :name, presence: true, inclusion: { in: ConsumableCatigory.names.keys }
end
