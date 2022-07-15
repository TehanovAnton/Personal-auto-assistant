# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:order) { create(:order_with_comments) }
  let(:comment) { order.comments.first }
  let(:user) { create(:user, role: :car_owner) }

  describe '#create' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'commentCreate' }
      let(:description) { 'create comment' }      
      let(:mutation) do
        <<~GQL
        mutation CommentCreate($commentInput:CommentCreateInput!) {
          commentCreate(input:$commentInput) {
            comment {
              id
              commentableId
              commentableType
              content
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "commentInput": {
            "commentInput": {
              "userId": user.id,
              "content": "hello message",
              "commentableId": order.id,
              "commentableType": Order.name
            }
          }
        }
      end
    end
  end

  describe '#update' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'commentUpdate' }
      let(:description) { 'update comment' }
      let(:mutation) do
        <<~GQL
        mutation CommentUpdate($commentInput:CommentUpdateInput!) {
          commentUpdate(input:$commentInput) {
            comment {
              id
              commentableId
              commentableType
              content
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "commentInput": {
            "id": comment.id,
            "commentInput": {
              "userId": user.id,
              "content": "hello updated comment",
              "commentableId": order.id,
              "commentableType": Order.name
          }
          }
        }
      end
    end
  end

  describe '#delete' do
    include_examples 'mutation return response' do
      let(:mutation_resolver) { 'commentDelete' }
      let(:description) { 'delete comment' }
      let(:mutation) do
        <<~GQL
        mutation CommentDelete($commentInput:CommentDeleteInput!) {
          commentDelete(input:$commentInput) {
            comment {
              id
              commentableId
              commentableType
              content
            }
          }
        }
        GQL
      end
      let(:input_variables) do
        {
          "commentInput": {
            "id": comment.id,
          }
        }
      end
    end
  end
end
