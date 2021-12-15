# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { car_owner: 0,
               service_owner: 1,
               admin: 2 }
end
