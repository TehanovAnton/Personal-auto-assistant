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
end
