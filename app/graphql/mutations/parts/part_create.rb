# frozen_string_literal: true

module Mutations
  module Parts
    class PartCreate < BaseMutation
      description 'Creates a new part'

      field :part, Types::PartType, null: false

      argument :part_input, Types::Inputs::PartInputType, required: true

      def resolve(part_input:)
        part = ::Part.new(**part_input)
        unless part.save
          raise GraphQL::ExecutionError.new 'Error creating part',
                                            extensions: part.errors.to_hash
        end

        { part: part }
      end
    end
  end
end
