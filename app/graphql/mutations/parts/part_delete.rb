# frozen_string_literal: true

module Mutations
  module Parts
    class PartDelete < BaseMutation
      description "Deletes a part by ID"
  
      field :part, Types::PartType, null: false
  
      argument :id, ID, required: true
  
      def resolve(id:)
        part = ::Part.find(id)
        raise GraphQL::ExecutionError.new "Error deleting part", extensions: part.errors.to_hash unless part.destroy
  
        { part: part }
      end
    end
  end
end
