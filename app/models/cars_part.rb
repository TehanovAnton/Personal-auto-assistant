# frozen_string_literal: true

class CarsPart < ApplicationRecord
  belongs_to :car
  belongs_to :part
end
