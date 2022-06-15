# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:organization) { create(:organization_with_service_and_work, name: 'best company') }
  let(:user) { organization.service_owner }
  before { sign_in user }

  describe '#works' do
    context 'when query correct' do
      include_examples "graphql query result shouldn't to be empty", 'works' do
      let(:query) do
        <<~GQL
          query {
            works(organizationId: #{organization.id}) {
              title
              categoryId
            }
          }            
        GQL
        end
      end 
    end
  end

  describe '#work' do
    context 'when query correct' do
      include_examples "graphql query result shouldn't to be empty", 'work' do
      let(:query) do
        <<~GQL
          query {
            work(organizationId: 7, workId: 1) {
              title
              categoryId
            }
          }            
        GQL
        end
      end 
    end
  end
end
