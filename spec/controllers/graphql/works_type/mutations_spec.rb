require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:work) { create(:work) }
  let(:category) { Category.create(name: 'drying') }

  describe '#create' do
    let(:mutation) do
      <<~GQL
      mutation WorkCreate($workInput: WorkCreateInput!) {
        workCreate(input: $workInput) {
          work {
            id
            title
            categoryId
          }
        }
      }
      GQL
    end

    let(:variables) do
      {
        workInput: {
          workInput: {
            title: "drying",
            categoryId: category.id
          }
        }
      }
    end

    it 'create work' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: variables)
      expect(result['data']['workCreate']).not_to be_empty
    end
  end

  describe '#update' do    
    let(:mutation) do
      <<~GQL
      mutation UpdateWork($workInput: WorkUpdateInput!) {
        workUpdate(input:$workInput) {
          work {
            id
            title
            categoryId
          }
        }
      }
      GQL
    end

    let(:variables) do
      {
        workInput: {
          id: work.id,
          workInput: {
            title: "updated title",
            categoryId: category.id,
          }
        }
      }
    end

    it 'update work' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: variables)
      expect(result['data']['workUpdate']).not_to be_empty
    end 
  end

  describe '#delete' do
    let(:mutation) do
      <<~GQL
      mutation WorkDelete($workInput:WorkDeleteInput!) {
        workDelete(input: $workInput) {
          work {
            id
            title
            categoryId
          }
        }
      }
      GQL
    end

    let(:variables) do
      {
        "workInput": {
          "id": work.id
        }
      }
    end

    it 'delete work' do
      result = PersonalAutoAssitatntSchema.execute(mutation, variables: variables)
      expect(result['data']['workDelete']).not_to be_empty
    end
  end
end
