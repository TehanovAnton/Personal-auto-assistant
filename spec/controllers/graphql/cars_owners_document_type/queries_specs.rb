require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:user) { create(:user_with_documents, role: :car_owner) }
  before { sign_in user }

  describe '#documents' do
    let(:query) do
      <<~GQL
        query {
          carsOwnersDocuments(userId: #{user.id}) {
            userId
            documentIdå
            issueDate
            termOfValidity
          }
        }
      GQL
    end

    it 'should reutrn array of user documents' do
      result = PersonalAutoAssitatntSchema.execute(query) 
      expect(result['data']['carsOwnersDocuments']).not_to be_empty
    end
  end
end
