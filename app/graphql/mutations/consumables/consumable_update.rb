# frozen_string_literal: true

module Mutations
  module Consumables
    class ConsumableUpdate < BaseMutation
      description 'Updates a consumable by id'

      field :consumable, Types::ConsumableType, null: false

      argument :id, ID, required: true
      argument :consumable_input, Types::Inputs::ConsumableInputType, required: true

      def resolve(id:, consumable_input:)
        consumable = ::Consumable.find(id)
        unless consumable.update(**consumable_input)
          raise GraphQL::ExecutionError.new 'Error updating consumable',
                                            extensions: consumable.errors.to_hash
        end

        { consumable: consumable }
      end
    end
  end
end
