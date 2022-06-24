# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:order) { create(:order_with_comments) }
  let(:user) { create(:user, role: :car_owner) }
  before { sign_in user }

  describe '#comments' do
    context 'when order has comments' do
      include_examples "graphql request shouldn't to be empty",
                       'comments' do
        let(:query) do
          <<~GQL
            query {
              comments(orderId: #{order.id}) {
                content
                user {
                  firstName
                  lastName
                }
              }
            }
          GQL
        end
      end
    end
  end

  describe '#comment' do
    context 'when order has comments' do
      include_examples "graphql request shouldn't to be empty",
                       'comment' do
        let(:query) do
          <<~GQL
            query {
              comment(orderId: #{order.id}, commentId: #{order.comments.first.id}) {
                content
                user {
                  firstName
                  lastName
                }
              }
            }
          GQL
        end
      end
    end
  end
end
