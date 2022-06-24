# frozen_string_literal: true

FactoryBot.define do
  factory :work do
    title { Faker::Lorem.sentence }
    category_id { category.id }
  end
end

def category
  category = Category.last
  category = Category.create(name: 'best category') unless category.present?

  category
end
