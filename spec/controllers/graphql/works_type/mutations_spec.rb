# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:work) { create(:work) }
  let(:category) { Category.create(name: 'drying') }

  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'workCreate' }
      let(:description) { 'create work' }
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
      let(:input_variables) do
        {
          workInput: {
            workInput: {
              title: 'drying',
              categoryId: category.id
            }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'workUpdate' }
      let(:description) { 'update work' }
      let(:work) { create(:work) }
      let(:category) { Category.create(name: 'drying') }
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
      let(:input_variables) do
        {
          workInput: {
            id: work.id,
            workInput: {
              title: 'updated title',
              categoryId: category.id
            }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'workDelete' }
      let(:description) { 'delete work' }
      let(:work) { create(:work) }
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
      let(:input_variables) do
        {
          "workInput": {
            "id": work.id
          }
        }
      end
    end 
  end
end
