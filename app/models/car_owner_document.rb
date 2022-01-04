# frozen_string_literal: true

class CarOwnerDocument < ApplicationRecord
  belongs_to :user
  belongs_to :document
end
