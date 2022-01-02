# frozen_string_literal: true

class Car < ApplicationRecord
  enum fuel_type: { petrol: 0, electricity: 1, gas: 2 }
  enum transmission_type: { mechanic: 0, automatic: 1 }

  belongs_to :user
end
