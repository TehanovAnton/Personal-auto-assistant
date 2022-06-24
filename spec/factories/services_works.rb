# frozen_string_literal: true

FactoryBot.define do
  factory :services_work do
    service_id { service.id }
    work_id { work.id }
  end
end

def service
  service = Service.last
  service = create(:service) unless service.present?

  service
end

def work
  work = Work.last
  work = create(:work) unless work.present?

  work
end
