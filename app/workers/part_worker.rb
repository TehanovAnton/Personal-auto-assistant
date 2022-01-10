# frozen_string_literal: true

class PartWorker
  include Sidekiq::Worker

  def perform
    CarsPart.all.each do |el|
      change_time = (el.update_at || el.created_at).to_time

      next if ((Time.current - change_time) / 1.year) < 1

      Orders::ClientMailer.with(car: el.car,
                                user: el.car.user,
                                part: el.part).car_part_last_update.deliver_later
    end
  end
end
