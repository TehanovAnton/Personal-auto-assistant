# frozen_string_literal: true

module Mutations
  module Parts
    class PartUpdate < BaseMutation
      description 'Updates a part by id'

      field :part, Types::PartType, null: false

      argument :id, ID, required: true
      argument :part_input, Types::Inputs::PartInputType, required: true

      def resolve(id:, part_input:)
        part = ::Part.find(id)
        unless part.update(**part_input)
          raise GraphQL::ExecutionError.new 'Error updating part',
                                            extensions: part.errors.to_hash
        end

        { part: part }
      end
    end
  end
end
