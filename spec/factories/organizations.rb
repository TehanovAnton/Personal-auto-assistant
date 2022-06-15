# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name {}
    email { Faker::Internet.safe_email }
    phone_number { Faker::PhoneNumber.cell_phone }
    address { "#{Faker::Address.city}, #{Faker::Address.street_name}, #{Faker::Address.building_number}" }
    service_owner_id { service_owner.id }

    factory :organization_with_service_and_work do
      after(:create) do |organization|
        service = create_service(organization: organization)
        work = create_work

        service.works << work
        organization.works << work
        
        organization.reload        
      end
    end

    factory :organization_with_service do
      after(:create) do |organization|
        create(:service, name: 'technical inspection',
                         organization_id: organization.id)
      end
    end
  end
end

def create_service(organization:, name: 'technical inspection')
  service = Service.where(name: name).first
  return service if service.present?

  create(:service, name: 'technical inspection', organization_id: organization.id)
end

def create_work(category: create_category, title: 'repare engine')
  work = Work.where(title: title).first
  return work if work.present?

  create(:work, title: title, category_id: category.id)
end

def create_category(name: 'cleaning')
  category = Category.where(name: name).first
  return category if category.present?

  Category.create(name: name)
end

def service_owner
  owner = ServiceOwner.last
  return owner if owner.present?

  create(:user, role: :service_owner)
end
