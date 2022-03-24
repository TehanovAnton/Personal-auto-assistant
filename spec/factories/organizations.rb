# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name {}
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.building_number}" }
    service_owner_id { ServiceOwner.last.id }

    factory :organization_with_service_and_work do
      after(:create) do |organization|
        service = create(:service, name: 'technical inspection', organization_id: organization.id)
        work = create(:work, title: 'repare engine', category_id: Category.last.id)
        service.works << work
        organization.works << work
      end
    end

    factory :organization_with_service do
      after(:create) do |organization|
        service = create(:service, name: 'technical inspection', 
                         organization_id: organization.id)
      end
    end
  end
end
