# frozen_string_literal: true

module Mutations
  module Consumables
    class ConsumableDelete < BaseMutation
      description 'Deletes a consumable by ID'

      field :consumable, Types::ConsumableType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        consumable = ::Consumable.find(id)
        unless consumable.destroy
          raise GraphQL::ExecutionError.new 'Error deleting consumable',
                                            extensions: consumable.errors.to_hash
        end

        { consumable: consumable }
      end
    end
  end
end
