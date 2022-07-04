# frozen_string_literal: true

# == Schema Information
#
# Table name: cars_parts
#
#  car_id     :integer          not null
#  part_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :bigint           not null, primary key
#
class CarsPart < ApplicationRecord
  belongs_to :car
  belongs_to :part
end
