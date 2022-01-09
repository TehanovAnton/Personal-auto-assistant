# frozen_string_literal: true

class ServicesWork < ApplicationRecord
  belongs_to :service
  belongs_to :work
end
