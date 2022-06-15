# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user, role: :car_owner) }
  let(:car) { create(:car_with_orders, user: user) } 
  before { sign_in user }

  describe '#orders' do
    context 'when query correct' do
      include_examples "graphql query result shouldn't to be empty", 'orders' do
        let(:query) do
          <<~GQL
            query {
              orders(carId: #{car.id}) {
                service {
                  name
                  organization {
                    name
                  }
                }
                work {
                  title
                }
                car {
                  maker
                }
              }
            }            
          GQL
        end
      end 
    end
  end

  describe '#order' do
    context 'when query correct' do
      include_examples "graphql query result shouldn't to be empty", 'order' do
        let(:query) do
          <<~GQL
            query {
              order(carId: #{car.id}, orderId: #{car.orders.last.id}) {
                service {
                  name
                  organization {
                    name
                  }
                }
                work {
                  title
                }
                car {
                  maker
                }
              }
            }            
          GQL
        end
      end 
    end
  end
end