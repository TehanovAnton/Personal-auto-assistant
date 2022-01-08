# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name {}
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.building_number}" }

    service_owner_id { ServiceOwner.last.id }

    factory :organization_with_service do
      after(:create) do |organization|
        Service.names.each_key do |service|
          FactoryBot.create(:service, name: service)
          FactoryBot.create(:service_work, title: "service_#{Time.current.strftime('%Y-%H:%M:%S:%L')}")
          OrganizationsServicesWorksPrice.create(organization_id: organization.id,
                                                 service_id: Service.last.id,
                                                 service_work_id: ServiceWork.last.id)
        end
      end
    end
  end
end
