# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    services_work_id { services_work.id }
    mileage { Faker::Number.between(from: 10_000, to: 100_000) }
    car_id { car.id }

    factory :order_with_comments do
      after(:create) do |order|
        5.times do
          Comment.create(user_id: commenter.id,
                         content: 'any text',
                         commentable_id: order.id,
                         commentable_type: Order.name)
        end
      end
    end
  end
end

def commenter
  user = User.last
  user = create(:user, role: :car_owner) unless user.present?

  user
end

def car
  car = Car.last
  car = create(:car, user_id: commenter.id) unless car.present?

  car
end

def services_work
  new_services_work = ServicesWork.last
  new_services_work = create(:services_work) unless new_services_work.present?

  new_services_work
end
