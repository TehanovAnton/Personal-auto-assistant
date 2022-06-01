# frozen_string_literal: true

%w[Minsk Brest Mogilev].each { |name| City.create(name: name) }
%w[Fuel Coolant Brake_Fluid].each do |name|
  ConsumableCategory.create(name: name)
end

# Car will have consumables, parts. User will have documents
FactoryBot.create(:user, role: 'service_owner', email: 'without_car@gmail.com')
FactoryBot.create(:user_with_car, role: 'service_owner', email: 'tehanovanton@gmail.com')

Category.create(name: 'cleaning')

# Create organization with service and work
FactoryBot.create(:organization_with_service_and_work, name: 'apolo')

FactoryBot.create(:user, role: :admin)
