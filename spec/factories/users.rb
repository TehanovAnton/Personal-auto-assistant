# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.cell_phone  }
    email { "#{first_name}#{last_name}@gmail.com" }
    password { 'ewqqwe' }

    factory :user_with_car do
      after(:create) do |user|
        create_list(:car, 1, user_id: user.id)

        user.reload
      end
    end

    after(:create) do |user|
      user.confirm
      binding.pry

      Document.names.each_key do |key|
        user.documents.push(create(:document, name: key))
      end

      user.reload
    end
  end
end
