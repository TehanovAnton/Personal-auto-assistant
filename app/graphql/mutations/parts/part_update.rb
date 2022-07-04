# frozen_string_literal: true

module Mutations
  module Parts
    class PartUpdate < BaseMutation
      description "Updates a part by id"
  
      field :part, Types::PartType, null: false
  
      argument :id, ID, required: true
      argument :part_input, Types::Inputs::PartInputType, required: true
  
      def resolve(id:, part_input:)
        part = ::Part.find(id)
        raise GraphQL::ExecutionError.new "Error updating part", extensions: part.errors.to_hash unless part.update(**part_input)
  
        { part: part }
      end
    end
  end
end
