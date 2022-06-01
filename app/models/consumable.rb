# frozen_string_literal: true

# == Schema Information
#
# Table name: car_consumable_values
#
#  id            :bigint           not null, primary key
#  car_id        :integer          not null
#  consumable_id :integer          not null
#  value         :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Consumable < ApplicationRecord
  belongs_to :car, dependent: :destroy
  belongs_to :consumable_category, dependent: :destroy

  delegate :name, to: :consumable_category

  validates :value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  delegate :id, to: :car, prefix: true
end
