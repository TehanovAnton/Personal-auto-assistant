# frozen_string_literal: true

# == Schema Information
#
# Table name: parts
#
#  id         :bigint           not null, primary key
#  name       :integer          default("engine"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Part < ApplicationRecord
  has_many :cars_part, dependent: :destroy
  has_many :cars, through: :car_parts

  enum name: { engine: 0,  motor: 1, brakes: 2 }

  validates :name, presence: true, inclusion: { in: Part.names.keys }
end
