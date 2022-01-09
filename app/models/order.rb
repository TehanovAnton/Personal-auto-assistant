# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :services_work
  belongs_to :car

  delegate :work, :service, to: :services_work
  delegate :organization, to: :service
  delegate :user, to: :car
end
