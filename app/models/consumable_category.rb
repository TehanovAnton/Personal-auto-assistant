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
class ConsumableCategory < ApplicationRecord
  has_many :car_consumable_values, dependent: :destroy
  has_many :cars, through: :car_consumable_values
end
