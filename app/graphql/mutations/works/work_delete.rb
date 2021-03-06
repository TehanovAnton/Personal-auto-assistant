# frozen_string_literal: true

module Mutations
  module Works
    class WorkDelete < BaseMutation
      description 'Deletes a work by ID'

      field :work, Types::WorkType, null: false

      argument :id, ID, required: true

      def resolve(id:)
        work = ::Work.find(id)
        unless work.destroy
          raise GraphQL::ExecutionError.new 'Error deleting work',
                                            extensions: work.errors.to_hash
        end

        { work: work }
      end
    end
  end
end
