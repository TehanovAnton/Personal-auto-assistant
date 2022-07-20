# frozen_string_literal: true

module Mutations
  module Consumables
    class ConsumableCreate < BaseMutation
      description 'Creates a new consumable'

      field :consumable, Types::ConsumableType, null: false

      argument :consumable_input, Types::Inputs::ConsumableInputType, required: true

      def resolve(consumable_input:)
        consumable = ::Consumable.new(**consumable_input)
        unless consumable.save
          raise GraphQL::ExecutionError.new 'Error creating consumable',
                                            extensions: consumable.errors.to_hash
        end

        { consumable: consumable }
      end
    end
  end
end
